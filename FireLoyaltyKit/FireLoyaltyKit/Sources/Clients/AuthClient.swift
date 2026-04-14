//
//  AuthClient.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 27/06/25.
//

// AuthClient.swift
import Foundation


public final class AuthClient {
    private let network: NetworkClient

    public init(network: NetworkClient = FireworksLoyaltyKit.network) {
        self.network = network
    }

    public func login(username : String,password: String,
                    onSuccess: @escaping (LoginResponse) -> Void,
                onError: @escaping (APIError) -> Void)
  {
   
      var params: [String:Any] = [:]
      params["email"] = username
      params["password"] = password
      params["type"] = ""
      
      let mm = AppUtills().createVC(date: (username + URLContstants.pvcSeKey))
      params["pvc"] = mm
      
    
    network.post(URLContstants.loginAPI, params: params, responseType: LoginResponse.self) { result in
      switch result {
      case .success(let resp):
        // 1) Persist tokens in Keychain
          
          KeychainHelper.shared.save(resp.token ?? "", forKey: KeychainKeys.accessToken)
          KeychainHelper.shared.save(resp.token ?? "", forKey: KeychainKeys.refreshToken)
          KeychainHelper.shared.save(resp.custid ?? "", forKey: KeychainKeys.custid)

        DispatchQueue.main.async { onSuccess(resp) }

      case .failure(let err):
        DispatchQueue.main.async { onError(err) }
      }
    }
  }
    public func login(param :[String:Any],
                    onSuccess: @escaping (LoginResponse) -> Void,
                onError: @escaping (APIError) -> Void)
  {
   
      //var params: [String:Any] = param
     
//      let mm = AppUtills().createVC(date: (username + URLContstants.pvcSeKey))
//      params["pvc"] = mm
      
    
      network.post(URLContstants.loginAPI, params: param, responseType: LoginResponse.self) { result in
      switch result {
      case .success(let resp):
        // 1) Persist tokens in Keychain
          
          KeychainHelper.shared.save(resp.token ?? "", forKey: KeychainKeys.accessToken)
          KeychainHelper.shared.save(resp.token ?? "", forKey: KeychainKeys.refreshToken)
          KeychainHelper.shared.save(resp.custid ?? "", forKey: KeychainKeys.custid)

        DispatchQueue.main.async { onSuccess(resp) }

      case .failure(let err):
        DispatchQueue.main.async { onError(err) }
      }
    }
  }
    
    public func sendOTPForLogin(param :[String:Any],
                    onSuccess: @escaping (GeneralResponseModel) -> Void,
                onError: @escaping (APIError) -> Void)
  {
   
      network.post(URLContstants.loginWithEmailAPI, params: param, responseType: GeneralResponseModel.self) { result in
      switch result {
      case .success(let resp):
        // 1) Persist tokens in Keychain
          
        DispatchQueue.main.async { onSuccess(resp) }

      case .failure(let err):
        DispatchQueue.main.async { onError(err) }
      }
    }
  }
    
    public func loginVerifyWithOTP(param :[String:Any],
                    onSuccess: @escaping (LoginResponse) -> Void,
                onError: @escaping (APIError) -> Void)
  {
   
      network.post(URLContstants.LoginWithEmailOTPVerifyAPI, params: param, responseType: LoginResponse.self) { result in
      switch result {
      case .success(let resp):
        // 1) Persist tokens in Keychain
          
          KeychainHelper.shared.save(resp.token ?? "", forKey: KeychainKeys.accessToken)
          KeychainHelper.shared.save(resp.token ?? "", forKey: KeychainKeys.refreshToken)
          KeychainHelper.shared.save(resp.custid ?? "", forKey: KeychainKeys.custid)

        DispatchQueue.main.async { onSuccess(resp) }

      case .failure(let err):
        DispatchQueue.main.async { onError(err) }
      }
    }
  }
   
    public func checkMobileNumber(
        params: [String:Any],
        onSuccess: @escaping (VerifyLoginResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
      network.post(URLContstants.checkPhoneNumberAPI, params: params, responseType: VerifyLoginResponse.self) { result in
          
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    //MARK: Fetch the current email status.
    /// - onSuccess: returns the decoded `GeneralResponseModel`
    /// - onError: returns the underlying `APIError`
    public func registerEmailCheckAPI(
        email : String,
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        var params: [String:Any] = [:]
        params["email"] = email
    
      network.post(URLContstants.registerEmailCheckAPI, params: params, responseType: GeneralResponseModel.self) { result in
          
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //
    //MARK: Register OTP
    /// - Parameters:
    ///   - params:
    ///   - onSuccess: onSuccess description
    ///   - onError: onError description
    public func registerOTPAPI(
        params: [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
      network.post(URLContstants.otpRegisterAPI, params: params, responseType: GeneralResponseModel.self) { result in
          
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: Regiter OTP verification
    /// - Parameters:
    ///   - params: params description
    ///   - onSuccess: onSuccess description
    ///   - onError: onError description
    public func registerOTPVerificationAPI(
        params: [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
      network.post(URLContstants.otpRegisterVerificationAPI, params: params, responseType: GeneralResponseModel.self) { result in
          
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func registerEmailOTPAPI(
        params: [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
      network.post(URLContstants.registerWithEmailSendOTPAPI, params: params, responseType: GeneralResponseModel.self) { result in
          
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func registerEmailOTPAPIV3(
        params: [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
      network.post(URLContstants.registerWithEmailSendOTPAPI_V3, params: params, responseType: GeneralResponseModel.self) { result in
          
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    //MARK: Regiter OTP verification
    /// - Parameters:
    ///   - params: params description
    ///   - onSuccess: onSuccess description
    ///   - onError: onError description
    public func registerEmailOTPVerificationAPI(
        params: [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
      network.post(URLContstants.registerWithEmailVerifyOTPAPI, params: params, responseType: GeneralResponseModel.self) { result in
          
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func registerEmailOTPVerificationAPIV3(
        params: [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
      network.post(URLContstants.registerWithEmailVerifyOTPAPI_V3, params: params, responseType: GeneralResponseModel.self) { result in
          
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    //MARK: Register User
    /// - Parameters:
    ///   - param: param description
    ///   - onSuccess: onSuccess description
    ///   - onError: onError description
    public func register(param :[String:Any],
                    onSuccess: @escaping (RegisterResponse) -> Void,
                onError: @escaping (APIError) -> Void)
  {
   
      //var params: [String:Any] = param
     
//      let mm = AppUtills().createVC(date: (username + URLContstants.pvcSeKey))
//      params["pvc"] = mm
      
    
      network.post(URLContstants.registerAPI, params: param, responseType: RegisterResponse.self) { result in
      switch result {
      case .success(let resp):
        // 1) Persist tokens in Keychain
          
          KeychainHelper.shared.save(resp.custid ?? "", forKey: KeychainKeys.custid)

      case .failure(let err):
        DispatchQueue.main.async { onError(err) }
      }
    }
   }
    
    public func registerV2(param :[String:Any],
                    onSuccess: @escaping (LoginResponse) -> Void,
                onError: @escaping (APIError) -> Void)
  {
   
      //var params: [String:Any] = param
     
//      let mm = AppUtills().createVC(date: (username + URLContstants.pvcSeKey))
//      params["pvc"] = mm
      
    
      network.post(URLContstants.registerV2API, params: param, responseType: LoginResponse.self) { result in
      switch result {
      case .success(let resp):
        // 1) Persist tokens in Keychain
          
          KeychainHelper.shared.save(resp.token ?? "", forKey: KeychainKeys.accessToken)
          KeychainHelper.shared.save(resp.token ?? "", forKey: KeychainKeys.refreshToken)
          KeychainHelper.shared.save(resp.custid ?? "", forKey: KeychainKeys.custid)
          
        DispatchQueue.main.async { onSuccess(resp) }

      case .failure(let err):
        DispatchQueue.main.async { onError(err) }
      }
    }
   }
    
    
    public func registerV3(param :[String:Any],
                    onSuccess: @escaping (LoginResponse) -> Void,
                onError: @escaping (APIError) -> Void)
  {
   
      //var params: [String:Any] = param
     
//      let mm = AppUtills().createVC(date: (username + URLContstants.pvcSeKey))
//      params["pvc"] = mm
      
    
      network.post(URLContstants.registerV3API, params: param, responseType: LoginResponse.self) { result in
      switch result {
      case .success(let resp):
        // 1) Persist tokens in Keychain
          
          KeychainHelper.shared.save(resp.token ?? "", forKey: KeychainKeys.accessToken)
          KeychainHelper.shared.save(resp.token ?? "", forKey: KeychainKeys.refreshToken)
          KeychainHelper.shared.save(resp.custid ?? "", forKey: KeychainKeys.custid)
          
        DispatchQueue.main.async { onSuccess(resp) }

      case .failure(let err):
        DispatchQueue.main.async { onError(err) }
      }
    }
   }
    
    //MARK: GIVE POINTS
    /// - Parameters:
    ///   - param: param description
    ///   - onSuccess: onSuccess description
    ///   - onError: onError description
    public func givePointsAPI(param :[String:Any],
                    onSuccess: @escaping (GivePointsResponse) -> Void,
                onError: @escaping (APIError) -> Void)
  {
   
      network.post(URLContstants.giveRewardsPoints, params: param, responseType: GivePointsResponse.self) { result in
      switch result {
      case .success(let resp):
       
        DispatchQueue.main.async { onSuccess(resp) }

      case .failure(let err):
        DispatchQueue.main.async { onError(err) }
      }
    }
  }
    
    //MARK: GET POINTS Details
    /// - Parameters:
    ///   - param: param description
    ///   - onSuccess: onSuccess description
    ///   - onError: onError description
    public func getPointDetailsAPI(param :[String:Any],
                    onSuccess: @escaping (GivePointsResponse) -> Void,
                onError: @escaping (APIError) -> Void)
  {
   
      network.post(URLContstants.getPointDetailsPI, params: param, responseType: GivePointsResponse.self) { result in
      switch result {
      case .success(let resp):
       
        DispatchQueue.main.async { onSuccess(resp) }

      case .failure(let err):
        DispatchQueue.main.async { onError(err) }
      }
    }
  }
    
    //MARK: Apply Tourist API
    /// - Parameters:
    ///   - param: param description
    ///   - onSuccess: onSuccess description
    ///   - onError: onError description
    public func applyTouristAPI(param :[String:Any],
                    onSuccess: @escaping (GeneralResponseModel) -> Void,
                onError: @escaping (APIError) -> Void)
  {
   
      network.post(URLContstants.applytTourist_API, params: param, responseType: GeneralResponseModel.self) { result in
      switch result {
      case .success(let resp):
       
        DispatchQueue.main.async { onSuccess(resp) }

      case .failure(let err):
        DispatchQueue.main.async { onError(err) }
      }
    }
  }
    //MARK: Add push Notifications.
    /// - onSuccess: returns the decoded `GeneralResponseModel`
    /// - onError: returns the underlying `APIError`
    public func addPushTokenAPI(
        token : String,
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
        var params: [String:Any] = [:]
        params["token"] = token
    
      network.post(URLContstants.registerEmailCheckAPI, params: params, responseType: GeneralResponseModel.self) { result in
          
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func changePasswordAPI(
        params: [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
      network.post(URLContstants.changePasswordAPI, params: params, responseType: GeneralResponseModel.self) { result in
          
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func resetPasswordAPI(
        params: [String:Any],
        onSuccess: @escaping (LoginResponse) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
      network.post(URLContstants.ResetPasswordAPI, params: params, responseType: LoginResponse.self) { result in
          
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    public func resetPasswordSendOTPAPI(
        params: [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
      network.post(URLContstants.resetPasswordSendOTPAPI, params: params, responseType: GeneralResponseModel.self) { result in
          
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func resetPasswordVerifyOTPAPI(
        params: [String:Any],
        onSuccess: @escaping (GeneralResponseModel) -> Void,
        onError:   @escaping (APIError) -> Void
    ) {
        
      network.post(URLContstants.resetPasswordVerifyOTPAPI, params: params, responseType: GeneralResponseModel.self) { result in
          
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }
}

// MARK: MODELS
public struct LoginResponse: Decodable, Identifiable {
    /// Use `custid` as the unique identifier
    public var id: String { custid ?? UUID().uuidString }

    public let status: String?
    public let message: String?
    public let custid: String?
    public let name: String?
    public let fname: String?
    public let lname: String?
    public let phone: String?
    public let email: String?
    public let change_password: String?
    public let register: String?
    public let url: String?
    public let token: String?
    public let reset: String?
    public let parent_custid: String?

    private enum CodingKeys: String, CodingKey {
        case status, message, custid, name, fname
        case lname
        case phone
        case email
        case change_password
        case register
        case url
        case token
        case reset
        case parent_custid
    }

    // If you want a default value for phone when the key is missing or null:
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status         = try container.decodeIfPresent(String.self, forKey: .status)
        message        = try container.decodeIfPresent(String.self, forKey: .message)
        custid         = try container.decodeIfPresent(String.self, forKey: .custid)
        name           = try container.decodeIfPresent(String.self, forKey: .name)
        fname          = try container.decodeIfPresent(String.self, forKey: .fname)
        lname        = try container.decodeIfPresent(String.self, forKey: .lname)
        phone          = try container.decodeIfPresent(String.self, forKey: .phone)
        email          = try container.decodeIfPresent(String.self, forKey: .email)
        change_password = try container.decodeIfPresent(String.self, forKey: .change_password)
        register       = try container.decodeIfPresent(String.self, forKey: .register)
        url            = try container.decodeIfPresent(String.self, forKey: .url)
        token          = try container.decodeIfPresent(String.self, forKey: .token)
        reset          = try container.decodeIfPresent(String.self, forKey: .reset)
        parent_custid  = try container.decodeIfPresent(String.self, forKey: .parent_custid)
    }
}

