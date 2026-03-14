//
//  InitClient.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 06/07/25.
//

public final class InitClient {
    private let network: NetworkClient
    
    /// Defaults to the shared NetBizKit.network
    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }
    
    /// Fetch the current user’s profile.
    /// - onSuccess: returns the decoded `DashboardResponse`
    /// - onError: returns the underlying `APIError`
    public func getMalls(
        param : [String:Any] = [:],
        onSuccess: @escaping (MallsResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.MallsAPI, params: param, responseType: MallsResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    // MARK: Get Memebers list API
    /// - Parameters:
    ///   - param: param description
    ///   - onSuccess: onSuccess description
    ///   - onError: onError description
    public func getInAppAlertsApi(
        param : [String:Any] = [:],
        onSuccess: @escaping (MembersAlertResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.MEMBERS_LIST_API, params: param, responseType: MembersAlertResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    // MARK: Get APP Alerts list API
    /// - Parameters:
    ///   - param: param description
    ///   - onSuccess: onSuccess description
    ///   - onError: onError description
    public func getAppAlertsListApi(
        param : [String:Any] = [:],
        onSuccess: @escaping (MembersAlertResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.AlertsAPI, params: param, responseType: MembersAlertResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func addDeviceTokenApi(
        param : [String:Any] = [:],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.deviceTokenAPI, params: param, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func showAlertsQRCodeApi(
        param : [String:Any] = [:],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.deepLinkQrcodeAPI, params: param, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
