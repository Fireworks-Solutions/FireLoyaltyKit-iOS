//
//  RewardsClient.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//

public final class RewardsClient {
    private let network: NetworkClient
    
    /// Defaults to the shared NetBizKit.network
    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }
    
    ///
    /// - onSuccess: returns the decoded `RewardsListResponse`
    /// - onError: returns the underlying `APIError`
    public func getRewardsList(
        onSuccess: @escaping (RewardsListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.rewardsListAPI, params: [:], responseType: RewardsListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: Reward Details
    public func getRewardDetails(
        param : [String:Any],
        onSuccess: @escaping (RewardsListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.rewardsListAPI, params: param, responseType: RewardsListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: Rewards Category List
    public func getRewardsCategoryList(
        onSuccess: @escaping (CategoryResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getCategoryAPI, params: [:], responseType: CategoryResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: MY Rewards List
    public func getMyRewardsList(
        onSuccess: @escaping (MyRewardsListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.myRewardsListAPI, params: [:], responseType: MyRewardsListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: My Reward Details
    public func getMyRewardDetails(
        param : [String:Any],
        onSuccess: @escaping (MyRewardDetailsResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.myRewardDetailsAPI, params: param, responseType: MyRewardDetailsResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: My Reward Details
    public func callCheckOutApi(
        param : [String:Any],
        onSuccess: @escaping (CheckOutModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.checkOutApi, params: param, responseType: CheckOutModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
