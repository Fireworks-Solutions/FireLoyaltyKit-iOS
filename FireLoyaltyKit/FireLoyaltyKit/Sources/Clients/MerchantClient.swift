//
//  MerchantClient.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 19/07/25.
//

public final class MerchantClient {
    private let network: NetworkClient
    
    /// Defaults to the shared NetBizKit.network
    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }
    
    /// Fetch the current user’s profile.
    /// - onSuccess: returns the decoded `PromotionListResponse`
    /// - onError: returns the underlying `APIError`
    public func getMerchantsList(
        parameters: [String: Any] = [:],
        onSuccess: @escaping (MerchantListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getDirectoryAPI, params: parameters, responseType: MerchantListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getMerchantDetails(
        parameters: [String: Any],
        onSuccess: @escaping (MerchantDetailsResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getMerchantDetail, params: parameters, responseType: MerchantDetailsResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
