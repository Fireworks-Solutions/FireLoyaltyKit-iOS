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
        param : [String:Any] = [:],
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
    
    //MARK: Reward Details
    public func getRewardDetails(
        param : [String:Any],
        onSuccess: @escaping (RewardDetailsResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.rewardDetailsAPI, params: param, responseType: RewardDetailsResponse.self) { result in
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
        param : [String:Any] = [:],
        onSuccess: @escaping (CategoryResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getCategoryAPI, params: param, responseType: CategoryResponse.self) { result in
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
        param : [String:Any] = [:],
        onSuccess: @escaping (MyRewardsListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.myRewardsListAPI, params: param, responseType: MyRewardsListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: MY Rewards List
    public func getMultiRewardsList(
        param : [String:Any] = [:],
        onSuccess: @escaping (MyRewardsListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.MultiRewardsListAPI, params: param, responseType: MyRewardsListResponse.self) { result in
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
    
    //MARK: checkout API
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
    
    
    //MARK: Stamp Rewards List API
    public func getStampRewardsList(
        param : [String:Any],
        onSuccess: @escaping (DailyCheckInResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.stampRewardsListAPI, params: param, responseType: DailyCheckInResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: getCheckedInStampReward
    public func getCheckedInStampReward(
        param : [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.stampRewardsListAPI, params: param, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: Gift Check out API
    public func callGiftCheckOutApi(
        param : [String:Any],
        onSuccess: @escaping (CheckOutModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.gift_CheckOut, params: param, responseType: CheckOutModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: Gift Check out API
    public func callShippingPointsApi(
        param : [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.get_shipping_points, params: param, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
