//
//  SettingsClient.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 19/07/25.
//

public final class SettingsClient {
    private let network: NetworkClient
    
    /// Defaults to the shared NetBizKit.network
    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }
    
    /// Fetch the States.
    /// - onSuccess: returns the decoded `StatesListResponse`
    /// - onError: returns the underlying `APIError`
    public func getStatesList(
        parameters: [String: Any] = [:],
        onSuccess: @escaping (StatesListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getBranchStatesAPI, params: parameters, responseType: StatesListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getCountryList(
        parameters: [String: Any] = [:],
        onSuccess: @escaping (CountryListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getCountryListAPI, params: parameters, responseType: CountryListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getCountryCodesList(
        parameters: [String: Any] = [:],
        onSuccess: @escaping (CountryCodesResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getCountryCodesListAPI, params: parameters, responseType: CountryCodesResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: Stamp Rewards List API
    public func getDailyRewardsList(
        param : [String:Any],
        onSuccess: @escaping (DailyCheckInResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.dailyCheckListAPI, params: param, responseType: DailyCheckInResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: getCheckedInStampReward
    public func getCheckedInDailyReward(
        param : [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.dailyCheckedInAPI, params: param, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    
    //MARK: getNotificationList
    public func getNotificationList(
        param : [String:Any],
        onSuccess: @escaping (NotificationListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getInboxAPI, params: param, responseType: NotificationListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getPurchasedCountAPI(
        param : [String:Any],
        onSuccess: @escaping (PurchasedCountResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.GET_PURCHASED_COUNT_API, params: param, responseType: PurchasedCountResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getSalutationAPI(
        param : [String:Any],
        onSuccess: @escaping (SalutationResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getSaluationAPI, params: param, responseType: SalutationResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getSupportTicketTypeListAPI(
        param : [String:Any],
        onSuccess: @escaping (SupportTicketListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.supportTicketListAPI, params: param, responseType: SupportTicketListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: getNotificationList
    public func callNotificationActionAPI(
        param : [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.inboxActionAPI, params: param, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: getReferralRewardAPI
    public func getReferralRewardAPI(
        param : [String:Any],
        onSuccess: @escaping (InviteModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.referralRewardAPI, params: param, responseType: InviteModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: getReferralRewardAPI
    public func sendFeedbackAPI(
        param : [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.supportAPI, params: param, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: uploadeDirectReceiptAPI
    public func uploadeDirectReceiptAPI(
        param : [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.uploadDirectReceiptAPI, params: param, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func readAllNotifications(
        parameters: [String: Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.readAllNotificationsAPI, params: parameters, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func deleteAccount(
        parameters: [String: Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.Delete_account_api, params: parameters, responseType: GeneralResponseModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
