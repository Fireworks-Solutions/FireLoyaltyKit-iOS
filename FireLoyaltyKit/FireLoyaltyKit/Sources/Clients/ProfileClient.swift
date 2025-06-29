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

    /// Fetch the current user’s profile.
    /// - onSuccess: returns the decoded `ProfileResult`
    /// - onError: returns the underlying `APIError`
    public func getProfile(
        onSuccess: @escaping (ProfileResult) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.GET_PROFILE, params: [:], responseType: ProfileModel.self) { result in
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
        _ params: [String: Any],
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
}
