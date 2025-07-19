//
//  DashboardClient.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//

public final class DashboardClient {
    private let network: NetworkClient
    
    /// Defaults to the shared NetBizKit.network
    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }
    
    /// Fetch the current user’s profile.
    /// - onSuccess: returns the decoded `ProfileResult`
    /// - onError: returns the underlying `APIError`
    public func getDashboard(
        param : [String:Any] = [:],
        onSuccess: @escaping (DashboardResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.dashboardAPI, params: param, responseType: DashboardResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getUsefullLinks(
        param : [String:Any] = [:],
        onSuccess: @escaping (UsefulLinksResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.usefullLinkAPI, params: param, responseType: UsefulLinksResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
