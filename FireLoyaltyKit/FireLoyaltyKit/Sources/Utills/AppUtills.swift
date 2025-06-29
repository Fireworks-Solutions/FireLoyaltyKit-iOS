//
//  EmailValidator.swift
//  DemoFrameWork
//
//  Created by Mani bhushan M on 27/06/25.
//


import Foundation
import CommonCrypto

public struct AppUtills {
    //MARK: VALID EMAIL
    public static func isValidEmail(_ email: String) -> Bool {
        // simple RFC-compliant regex
        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return email.range(of: pattern, options: .regularExpression) != nil
    }
    
    //MARK: PASSWORD VALIDATION -- At least 8 chars, 1 uppercase, 1 digit
    public static func isValidPassword(_ password: String) -> Bool {
        let pattern = #"(?=.{8,})(?=.*[A-Z])(?=.*\d)"#
        return password.range(of: pattern, options: .regularExpression) != nil
    }
    
    public static func getLog() -> [ApiLogModel] {
       
        if let logsJson = KeychainHelper.shared.read(KeychainKeys.apilogs),
           let data = logsJson.data(using: .utf8),
           let logs = try? JSONDecoder().decode([ApiLogModel].self, from: data) {
            
            return logs
        }
        
        return []
    }
    
    
    func getStringDate() -> String {
        let date = "\(Int(Date.timeIntervalBetween1970AndReferenceDate))"
        return date
    }

    func createVC(date: String) -> String? {
        
        guard let messageData = date.data(using:String.Encoding.utf8) else { return nil }
        
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes { digestBytes in
            messageData.withUnsafeBytes { messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        
        let result = digestData.map { String(format: "%02hhx", $0) }.joined()
        
        return result
    }
}
