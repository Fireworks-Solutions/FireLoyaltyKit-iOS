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
    
    public func getMemberAlertsApi(
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
}
