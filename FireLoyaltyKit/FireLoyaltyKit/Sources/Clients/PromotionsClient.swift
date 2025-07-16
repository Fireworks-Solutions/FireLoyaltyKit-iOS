//
//  PromotionsClient.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 06/07/25.
//

public final class PromotionsClient {
    private let network: NetworkClient
    
    /// Defaults to the shared NetBizKit.network
    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }
    
    /// Fetch the current user’s profile.
    /// - onSuccess: returns the decoded `PromotionListResponse`
    /// - onError: returns the underlying `APIError`
    public func getPromotionsList(
        parameters: [String: Any] = [:],
        onSuccess: @escaping (PromotionListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.promotionsListAPI, params: parameters, responseType: PromotionListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getPromotionDetails(
        parameters: [String: Any],
        onSuccess: @escaping (PromotionDetailResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.promotionDetailsAPI, params: parameters, responseType: PromotionDetailResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
