//
//  ScanReceiptClient.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 21/05/26.
//

public final class ScanReceiptClient {
    private let network: NetworkClient
    
    /// Defaults to the shared NetBizKit.network
    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
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
    
    //MARK: uploadeDirectReceiptAPI
    public func uploadeManualReceiptAPI(
        param : [String:Any],
        onSuccess: @escaping (OcrResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.uploadReceiptAPI, params: param, responseType: OcrResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: uploadeDirectReceiptAPI
    public func addScannedReceiptAPI(
        param : [String:Any],
        onSuccess: @escaping (AddScanReceiptResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.AddScanReceiptAPI, params: param, responseType: AddScanReceiptResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getScanMerchantBranchList(
        param : [String:Any] = [:],
        onSuccess: @escaping (ScanReceiptBranchListResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        network.post(URLContstants.getMerchantBranchList, params: param, responseType: ScanReceiptBranchListResponse.self) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
}
