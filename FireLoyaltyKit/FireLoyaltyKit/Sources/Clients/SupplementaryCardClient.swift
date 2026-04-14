//
//  SupplementaryCardClient.swift
//  FireLoyaltyKit
//
//  Created by Tao on 14/04/26.
//

public final class SupplementCardClient {
    private let network: NetworkClient

    /// Defaults to the shared NetBizKit.network
    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }

    /// Fetch the current user’s supplement cards.
    /// - onSuccess: returns the decoded `SupplementaryListResponse`
    /// - onError: returns the underlying `APIError`
    public func getSupplementCards(
        param : [String:Any] = [:],
        onSuccess: @escaping (SupplementaryListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        network.post(URLContstants.getSupplementaryCards, params: param, responseType: SupplementaryListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func switchMember(
        param : [String:Any] = [:],
        onSuccess: @escaping (LoginResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        network.post(URLContstants.switchMember, params: param, responseType: LoginResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }

    /// Add supplementary member to current user.
    /// - body: your `AddSupplementaryResponse` (it must be Encodable—you can conform it if needed)
    /// - onSuccess: returns the updated `AddSupplementaryResponse`
    /// - onError: returns the underlying `APIError`
    public func addSupplementary(
        params: [String: Any],
        onSuccess: @escaping (AddSupplementaryResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.addSupplementaryCard, params: params, responseType: AddSupplementaryResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
