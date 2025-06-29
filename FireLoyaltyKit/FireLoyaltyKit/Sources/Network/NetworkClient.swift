//
//  APIError.swift
//  DemoFrameWork
//
//  Created by Mani bhushan M on 27/06/25.
//


import Foundation

/// Your common API errors
public enum APIError: Error {
    case invalidURL, networkError(Error), invalidResponse, decodingError(Error)
}

/// Internal request queue & refresh logic
public final class NetworkClient {
    private let session: URLSession
    private let config: FireLoyaltyConfiguration
    
    
    private var isRefreshing = false
    private var requestQueue: [() -> Void] = []
    
    /// Hard-code your refresh endpoint here:
    private let refreshPath = URLContstants.REFRESH_TOKEN_API
    
    public init(session: URLSession = .shared,
                configuration: FireLoyaltyConfiguration) {
        self.session = session
        self.config = configuration
    }
    
    /// Central send that handles 401 → refresh → retry
    private func send<T: Decodable>(
        buildRequest: @escaping () -> URLRequest?,
        responseType: T.Type,
        retryOn401: Bool = true,
        completion: @escaping (Result<T, APIError>) -> Void
    ) {
        guard let request = buildRequest() else {
            return completion(.failure(.invalidURL))
        }
        
        session.dataTask(with: request) { data, resp, err in
            
            // Log if we got an HTTPURLResponse
            if let http = resp as? HTTPURLResponse, self.config.enableDebug {
                self.log(request: request, response: http, data: data)
            }
            
            if let err = err {
                return completion(.failure(.networkError(err)))
            }
            guard let http = resp as? HTTPURLResponse else {
                return completion(.failure(.invalidResponse))
            }
            
            // 401? queue + refresh
            if http.statusCode == 401, retryOn401 {
                self.requestQueue.append {
                    self.send(buildRequest: buildRequest, responseType: responseType, retryOn401: false, completion: completion)
                }
                if !self.isRefreshing {
                    self.isRefreshing = true
                    self.doRefresh { success in
                        self.isRefreshing = false
                        if !success {
                            // fail all queued
                            self.requestQueue.forEach { _ in
                                completion(.failure(.invalidResponse))
                            }
                            self.requestQueue.removeAll()
                        }
                    }
                }
                return
            }
            
            guard 200..<300 ~= http.statusCode, let data = data else {
                return completion(.failure(.invalidResponse))
            }
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
    
    /// Perform the token-refresh call, update Keychain, then drain queue.
    private func doRefresh(completion: @escaping (Bool) -> Void) {
        guard let refreshToken = KeychainHelper.shared.read(KeychainKeys.refreshToken) else {
            return completion(false)
        }
        let url = config.baseURL.appendingPathComponent(refreshPath)
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["refreshToken": refreshToken]
        req.httpBody = try? JSONEncoder().encode(body)
        
        session.dataTask(with: req) { data, resp, err in
            guard err == nil,
                  let data = data,
                  let http = resp as? HTTPURLResponse,
                  200..<300 ~= http.statusCode,
                  let json = try? JSONDecoder().decode([String:String].self, from: data),
                  let newAccess = json["accessToken"]
            else {
                return completion(false)
            }
            
            // save new tokens
            KeychainHelper.shared.save(newAccess,    forKey: KeychainKeys.accessToken)
            if let newRefresh = json["refreshToken"] {
                KeychainHelper.shared.save(newRefresh, forKey: KeychainKeys.accessToken)
            }
            
            // retry queued
            let queued = self.requestQueue
            self.requestQueue.removeAll()
            queued.forEach { $0() }
            completion(true)
        }.resume()
    }
    
    // MARK: - Public GET
    public func get<T: Decodable>(
        _ path: String,
        responseType: T.Type,
        completion: @escaping (Result<T, APIError>) -> Void
    ) {
        send(buildRequest: {
            guard let url = URL(string: path, relativeTo: self.config.baseURL) else { return nil }
            var req = URLRequest(url: url)
            req.httpMethod = "GET"
            //            if let token = KeychainHelper.shared.read(KeychainKeys.accessToken) {
            //                req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            //            }
            return req
        }, responseType: responseType, completion: completion)
    }
    
    /// POST with a JSON dictionary body.
    /// - Parameters:
    ///   - path: the relative path (e.g. "profile/update")
    ///   - params: a `[String:Any]` dictionary. Must be JSON‐serializable.
    ///   - responseType: the `Decodable` type you expect back.
    ///   - completion: your success / failure callback.
   public func post<T: Decodable>(
        _ path: String,
        params: [String:Any],
        responseType: T.Type,
        completion: @escaping (Result<T,APIError>) -> Void
    ) {
        
        let date = AppUtills().getStringDate()
        let vc = AppUtills().createVC(date: "\(URLContstants.AUTH_TOKEN_PASS)\(date)") ?? ""
        
        let custid = KeychainHelper.shared.read(KeychainKeys.custid) ?? ""
        
        var param: [String:Any] = params
        param["date"] = date
        param["vc"] = vc
        param["mercid"] = "44"
        param["sectoken"] = KeychainHelper.shared.read(KeychainKeys.accessToken) ?? ""
        param["custid"] = KeychainHelper.shared.read(KeychainKeys.custid) ?? ""
        param["lang"] = "en"
        param["os"] = "iOS"
        param["deviceid"] = KeychainHelper.shared.read(KeychainKeys.deviceId) ?? ""
        param["devicetype"] = KeychainHelper.shared.read(KeychainKeys.deviceModel) ?? ""
        param["svc"] = URLContstants.secretKeyPass
        
        if custid.count > 0 {
            param["pvc"] = AppUtills().createVC(date: (custid + URLContstants.pvcSeKey))
        }
        
        send(buildRequest: {
            // 1) build URL
            guard let url = URL(string: path, relativeTo: self.config.baseURL) else { return nil }
            var req = URLRequest(url: url)
            req.httpMethod = "POST"
            //req.setValue("application/json", forHTTPHeaderField: "Content-Type")
            req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            // 2) attach token
            //                if let token = KeychainHelper.shared.read(KeychainKeys.accessToken) {
            //                    req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            //                }
            
            // 3) percent-encode params
            let formString = param.map { key, value -> String in
                let escapedKey   = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                let escapedValue = "\(value)"
                    .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                return "\(escapedKey)=\(escapedValue)"
            }.joined(separator: "&")
            
            req.httpBody = formString.data(using: .utf8)
            
            return req
        }, responseType: responseType, completion: completion)
    }
    
    
    private func log(request: URLRequest,
                     response: HTTPURLResponse,
                     data: Data?) {
        let apiName = request.url?.path ?? request.url?.absoluteString ?? ""
        let reqBody = request.httpBody.flatMap { String(data: $0, encoding: .utf8) } ?? ""
        let respBody = data.flatMap { String(data: $0, encoding: .utf8) } ?? ""
        
        let entry = ApiLogModel(
            apiName:      apiName,
            apiRequest:   reqBody,
            responseCode: response.statusCode,
            response:     respBody
        )
        
        // 1) load existing logs
        var logs: [ApiLogModel] = []
        if let json = KeychainHelper.shared.read(KeychainKeys.apilogs),
           let d = json.data(using: .utf8),
           let arr = try? JSONDecoder().decode([ApiLogModel].self, from: d) {
            logs = arr
        }
        
        // 2) append & re-save
        logs.append(entry)
        if let newData = try? JSONEncoder().encode(logs),
           let newJson = String(data: newData, encoding: .utf8) {
            KeychainHelper.shared.save(newJson, forKey: KeychainKeys.apilogs)
        }
    }
}

public struct ApiLogModel: Codable {
    public let apiName: String
    public let apiRequest: String
    public let responseCode: Int
    public let response: String
    public let timestamp: Date
    
    public init(apiName: String,
                apiRequest: String,
                responseCode: Int,
                response: String,
                timestamp: Date = .init()) {
        self.apiName = apiName
        self.apiRequest = apiRequest
        self.responseCode = responseCode
        self.response = response
        self.timestamp = timestamp
    }
}
