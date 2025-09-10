//
//  TransactionHistoryClient.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 06/07/25.
//

public final class TransactionHistoryClient {
    private let network: NetworkClient
    
    /// Defaults to the shared NetBizKit.network
    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }
    
    /// Fetch the current user’s profile.
    /// - onSuccess: returns the decoded `PromotionListResponse`
    /// - onError: returns the underlying `APIError`
    public func getTransactionList(
        parameters: [String: Any] = [:],
        onSuccess: @escaping (TransactionHistoryResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.transactionHistoryAPI, params: parameters, responseType: TransactionHistoryResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getTransactionListDetails(
        parameters: [String: Any],
        onSuccess: @escaping (THdetailsResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.transactionHistoryDetailsAPI, params: parameters, responseType: THdetailsResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func archiveTransactionItem(
        parameters: [String: Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.archiveTransactionAPI, params: parameters, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func payWithPointsAPI(
        parameters: [String: Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.PAY_WITH_POINTS_API, params: parameters, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func releasePointsAPI(
        parameters: [String: Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.Release_Points_API, params: parameters, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
