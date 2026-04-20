//
//  EyePrescriptionClient.swift
//  FireLoyaltyKit
//
//  Created by Tao on 21/04/26.
//

public final class EyePrescriptionClient {
    private let network: NetworkClient

    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }

    public func getEyePrescriptionsList(
        param : [String:Any] = [:],
        onSuccess: @escaping (EyePrescriptionListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        network.post(URLContstants.getPrescriptionsList, params: param, responseType: EyePrescriptionListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getPrescriptionDetail(
        param : [String:Any] = [:],
        onSuccess: @escaping (EyePrescriptionDetailResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        network.post(URLContstants.getPrescriptionDetail, params: param, responseType: EyePrescriptionDetailResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}
