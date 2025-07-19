//
//  EventsClient.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 28/06/25.
//

public final class EventsClient {
    private let network: NetworkClient
    
    /// Defaults to the shared NetBizKit.network
    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }
    
    //MARK: Event List
    public func getEventsList(
        param : [String:Any] = [:],
        onSuccess: @escaping (EventsListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.eventsAPI, params: param, responseType: EventsListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: Event Details
    public func getEventsDetails(
        param : [String:Any],
        onSuccess: @escaping (EventDetailsResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.eventsAPI, params: param, responseType: EventDetailsResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: MY RSVPs List
    public func getMyRsvpsList(
        onSuccess: @escaping (MyRsvpsListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.RSVPListAPI, params: ["type":"event"], responseType: MyRsvpsListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: My RSVPs Details
    public func getMyRsvpsDetails(
        param : [String:Any],
        onSuccess: @escaping (MyRsvpDetailsResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.RSVPDetailsAPI, params: param, responseType: MyRsvpDetailsResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: Event check out
    public func callEventCheckOutApi(
        param : [String:Any],
        onSuccess: @escaping (EventCheckOutModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.eventCheckOutAPI, params: param, responseType: EventCheckOutModel.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
