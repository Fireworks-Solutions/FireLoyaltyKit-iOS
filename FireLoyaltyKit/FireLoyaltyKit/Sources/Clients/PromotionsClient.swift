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
    
    public func getArticlesList(
        parameters: [String: Any] = [:],
        onSuccess: @escaping (ArticlesListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.articlesListAPI, params: parameters, responseType: ArticlesListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getArticleDetails(
        parameters: [String: Any],
        onSuccess: @escaping (ArticleDetailResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.articleDetailsAPI, params: parameters, responseType: ArticleDetailResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getArticleCategory(
        parameters: [String: Any],
        onSuccess: @escaping (CategoryResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.articleCategoriesAPI, params: parameters, responseType: CategoryResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getNewsCategory(
        parameters: [String: Any],
        onSuccess: @escaping (CategoryResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.newsCategoryDetailsAPI, params: parameters, responseType: CategoryResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    
}
