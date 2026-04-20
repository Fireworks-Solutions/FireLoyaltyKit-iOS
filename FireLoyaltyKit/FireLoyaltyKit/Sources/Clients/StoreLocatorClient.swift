//
//  StoreLocatorClient.swift
//  FireLoyaltyKit
//
//  Created by Tao on 21/04/26.
//

public final class StoreLocatorClient {
    private let network: NetworkClient

    /// Defaults to the shared NetBizKit.network
    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }

    /// Fetch the store locator's filters.
    /// - onSuccess: returns the decoded `StoreLocatorFilterResponse`
    /// - onError: returns the underlying `APIError`
    public func getStoreLocatorFilters(
        param : [String:Any] = [:],
        onSuccess: @escaping (StoreLocatorFilterResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        network.post(URLContstants.getStoreLocatorFilters, params: param, responseType: StoreLocatorFilterResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }

    /// Fetch the store locator's filters.
    /// - onSuccess: returns the decoded `StoreLocatorResultResponse`
    /// - onError: returns the underlying `APIError`
    public func getStoreLocatorResults(
        params: [String: Any],
        onSuccess: @escaping (StoreLocatorResultResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getStoreLocatorResults, params: params, responseType: StoreLocatorResultResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
