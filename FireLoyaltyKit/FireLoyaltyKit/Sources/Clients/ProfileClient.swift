//
//  ProfileClient.swift
//  DemoFrameWork
//
//  Created by Mani bhushan M on 27/06/25.
//


import Foundation

// let url = "http://demo.fireworksmedia.com/loyalty/api2/profile.php?"
  
public final class ProfileClient {
    private let network: NetworkClient

    /// Defaults to the shared NetBizKit.network
    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }

    /// Switch the logged-in account between a principal card and its linked supplementary cards
    /// (`api2/switchCard.php`).
    ///
    /// The network layer sends the *current* account's `custid` and `sectoken` automatically, so the
    /// caller only provides the target. When the server reports `status == "success"` the new `custid`,
    /// access token and refresh token are stored in the Keychain, so every following call is made as the
    /// switched-to account. Otherwise the Keychain is left untouched.
    /// - Parameters:
    ///   - targetCustid: the supplementary card to switch to, or the principal's custid to switch back.
    ///   - onSuccess: the decoded `LoginResponse` (includes `is_principal`). Check `status`/`message`: a
    ///     server-side rejection (e.g. expired token, card not linked) is delivered here with a non-success status.
    ///   - onError: the underlying `APIError` for transport/decoding failures.
    public func switchCard(
        targetCustid: String,
        onSuccess: @escaping (LoginResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        let params: [String: Any] = ["target_custid": targetCustid]

        network.post(URLContstants.switchCard, params: params, responseType: LoginResponse.self) { result in
            switch result {
            case .success(let resp):
                if (resp.status ?? "").lowercased() == "success" {
                    KeychainHelper.shared.save(resp.custid ?? "", forKey: KeychainKeys.custid)
                    KeychainHelper.shared.save(resp.token ?? "", forKey: KeychainKeys.accessToken)
                    KeychainHelper.shared.save(resp.token ?? "", forKey: KeychainKeys.refreshToken)
                }
                onSuccess(resp)
            case .failure(let error):
                onError(error)
            }
        }
    }

    /// Fetch the current user’s profile.
    /// - onSuccess: returns the decoded `ProfileResult`
    /// - onError: returns the underlying `APIError`
    public func getProfile(
        param : [String:Any] = [:],
        onSuccess: @escaping (ProfileResult) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.GET_PROFILE, params: param, responseType: ProfileModel.self) { result in
            switch result {
            case .success(let model):
                if let profile = model.profile {
                    onSuccess(profile)
                } else {
                    onError(.invalidResponse)
                }
            case .failure(let error):
                onError(error)
            }
        }
    }

    /// Fetch the cached profile payload (served from the backend's cache tier).
    /// - onSuccess: returns the decoded `ProfileResult`
    /// - onError: returns the underlying `APIError`
    public func getProfileCache(
        param : [String:Any] = [:],
        onSuccess: @escaping (ProfileResult) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {

        network.post(URLContstants.GET_PROFILE_CACHE, params: param, responseType: ProfileModel.self) { result in
            switch result {
            case .success(let model):
                if let profile = model.profile {
                    onSuccess(profile)
                } else {
                    onError(.invalidResponse)
                }
            case .failure(let error):
                onError(error)
            }
        }
    }

    /// Save (update) the user’s profile on the server.
    /// - body: your `ProfileResult` (it must be Encodable—you can conform it if needed)
    /// - onSuccess: returns the updated `ProfileResult`
    /// - onError: returns the underlying `APIError`
    public func saveProfile(
        params: [String: Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.UPDATE_PROFILE, params: params, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    /// Fetch the branch list.
    /// - onSuccess: returns the decoded `MerchantBranchResponse`
    /// - onError: returns the underlying `APIError`
    public func getBranchList(
        param : [String:Any] = [:],
        onSuccess: @escaping (MerchantBranchResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        network.post(URLContstants.getMerchantBranchList, params: param, responseType: MerchantBranchResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
