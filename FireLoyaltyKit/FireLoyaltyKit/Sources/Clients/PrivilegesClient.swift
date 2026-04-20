//
//  PrivilegesClient.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 18/09/25.
//

public final class PrivilegesClient {
    private let network: NetworkClient
    
    /// Defaults to the shared NetBizKit.network
    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }
    
    /// Fetch the current user’s profile.
    /// - onSuccess: returns the decoded `ProfileResult`
    /// - onError: returns the underlying `APIError`
    public func getPrivilegesDashboard(
        param : [String:Any] = [:],
        onSuccess: @escaping (DashboardResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.PRIVILEGES_DASHBOARD, params: param, responseType: DashboardResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    // create api like above with getting RankInfo and PrivilegeLevels
        
    public func getPrivilegesRanksInfo(
        param : [String:Any] = [:],
        onSuccess: @escaping (RanksInfoResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.get(URLContstants.PRIVILEGES_RANKS_INFO, params: param, responseType: RanksInfoResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
