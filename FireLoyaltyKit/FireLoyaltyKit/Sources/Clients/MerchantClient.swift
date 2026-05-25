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
    
    public func getMerchantCategories(
        parameters: [String: Any] = [:],
        onSuccess: @escaping (MerchantCategoryResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getMerchantCategories, params: parameters, responseType: MerchantCategoryResponse.self) { result in
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
    
    public func getDirectoryFloorsList(
        parameters: [String: Any] = [:],
        onSuccess: @escaping (FloorsListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getDirectoryFloorsList, params: parameters, responseType: FloorsListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: FACILITIES
    public func getFacilityCategories(
        parameters: [String: Any] = [:],
        onSuccess: @escaping (CategoryResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.facility_categories_Api, params: parameters, responseType: CategoryResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getFacilityFloorsList(
        parameters: [String: Any] = [:],
        onSuccess: @escaping (FloorsListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.facility_get_Floor_Api, params: parameters, responseType: FloorsListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getFacilitiesList(
        parameters: [String: Any],
        onSuccess: @escaping (FacilityListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getFacilitiesList_Api, params: parameters, responseType: FacilityListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getFacilityDetails(
        parameters: [String: Any],
        onSuccess: @escaping (FacilityDetailsResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.facility_Details_Api, params: parameters, responseType: FacilityDetailsResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
