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
    public static func validpassword(mypassword : String) -> Bool
    {
        //  one Uppercase Alphbet,
        //  one digit
        //  one symbol
        //  min 8 characters total
        let passwordreg =  ("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$")
        let passwordtesting = NSPredicate(format: "SELF MATCHES %@", passwordreg)
        return passwordtesting.evaluate(with: mypassword)
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
    
    
    // check NRIC Validation
    /*
     Logic for NRIC validation
     xxxxxx-xx-xxxx or xxxxxxxxxxxx
     Example: 801004-75-2245 or 801004752245

     First 6 digits to be validated for yymmdd
     Year cannot be greater than current year
     Month can be only 01 to 12
     Date can be only from 01 - 31
     In the above example: date of birth is 4th October 1980

     Second 2 digits (Birth Location)
     Cannot contain the digits 00,17,18,19,20,69,70,73,80,81,94,95,96,96
     In the above example birth location is 75

     Third 4 digits
     Take only the last digit and check if its odd or even, if odd means male and if even means female
     In the above Example: 2245 = last digit is 5 = its odd so its male
     */
    
    public static func isValidNRIC(_ str : String , dob : String , cGender : Int,id_type : Int) -> Bool {
        //var nric = str
        
        var nric = str
        //"801004-75-2245";
         nric = nric.trimmingCharacters(in: .whitespaces)
         
        if nric.contains("-") {
           nric = nric.replacingOccurrences(of: "-", with: "")
        }

         if  id_type == 0 {
             //nric.count < 12 &&
             
//            let PASSPORT_REG_EX = "^[a-zA-Z0-9]{2}[0-9]{5,}$"
//             //"^[a-zA-Z][0-9]{7}$"
//            let passport = NSPredicate(format:"SELF MATCHES %@", PASSPORT_REG_EX)
//
//            return passport.evaluate(with: nric)
             
             return (nric.count > 4 && nric.count < 11)
        }
        //let dob = "04-11-80" //need to convert to yy-mm-dd
        let birthLocArr = [00,17,18,19,20,69,70,73,80,81,94,95,96]
        let nricArr = Array(nric)

        var birthInfo = ""
        var birthLoc = ""
        var gender = ""

        for (index , ch) in nricArr.enumerated() {
            if index <= 5 {
                birthInfo.append(ch)
            }else if index > 5 && index <= 7 {
                birthLoc.append(ch)
            }else if index == 11 {
                gender.append(ch)
            }
        }

        let isInValid = birthLocArr.contains(Int(birthLoc) ?? 0)
        let genderSt = ((Int(gender) ?? 2) % 2) == 0 ? 2 : 1
        
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        var cd = ""
        if let dd  = df.date(from: dob) {
        df.dateFormat = "yyMMdd"
         cd = df.string(from: dd)
        }

        
         
//         if dob == "" && cGender == 0 {
//             return !(isInValid)
//         }
         
         if dob == "" {
             return !(isInValid)
         }
         
//         if cGender == 0 {
//             return ((birthInfo == cd) && !(isInValid))
//         }

        if (birthInfo == cd) && !(isInValid){
            return true
        }
         
        //log("\((birthInfo == cd) ? "DOB valid" : "DOB not valid" ) ::: \(isInValid ? "Birth loc Invalid" : "Birth loc Valid") ::: \(genderSt) user gender \(cGender)")
         
        return false
    }
    
    //MARK: Validate NRIC
    public static func isValidNRIC(_ str : String , id_type : Int) -> Bool {
        var nric = str
        //"801004-75-2245";
         nric = nric.trimmingCharacters(in: .whitespaces)
         
        if nric.contains("-") {
           nric = nric.replacingOccurrences(of: "-", with: "")
        }

         if id_type == 0 {
//            let PASSPORT_REG_EX = "^[a-zA-Z0-9]{2}[0-9]{5,}$"
//             //"^[a-zA-Z][0-9]{7}$"
//            let passport = NSPredicate(format:"SELF MATCHES %@", PASSPORT_REG_EX)
//
//            return passport.evaluate(with: nric)
             return (nric.count >= 4 && nric.count <= 10)
         }
        
        if id_type == 1 {
            return nric.count == 12
        }

        if id_type == 2 {
            return nric.count >= 5
        }
        
        return true
        
    }
    
    //MARK: Return Date of Birth from NRIC
    public static func returnDOB(_ str : String) -> (String , Int , String){
        
        var nric = str
        //"801004-75-2245";
         nric = nric.trimmingCharacters(in: .whitespaces)
         
        if nric.contains("-") {
           nric = nric.replacingOccurrences(of: "-", with: "")
        }
        
        let nricArr = Array(nric)

        var birthInfo = ""
        var birthLoc = ""
        var gender = ""

        for (index , ch) in nricArr.enumerated() {
            if index <= 5 {
                birthInfo.append(ch)
            }else if index > 5 && index <= 7 {
                birthLoc.append(ch)
            }else if index == 11 {
                gender.append(ch)
            }
        }


        let genderSt = ((Int(gender) ?? 2) % 2) == 0 ? 2 : 1
        let genderString = (genderSt == 1) ? "Male" : "Female"
        
        //"dd/MM/yyyy"
        let df = DateFormatter()
        
        let yr = Int(birthInfo.prefix(2)) ?? 0
        df.dateFormat = "yy"
        let cD = df.string(from: Date())
        let currentYr = Int(cD) ?? 22
       
        let rstr  = String(birthInfo.dropFirst(2))
        birthInfo = rstr
        if yr >= 0 && yr <= currentYr {
            
            birthInfo = "20\(yr == 0 ? "00" : "\((yr <= 9 && yr >= 1) ? "0\(yr)" : "\(yr)")")\(birthInfo)"
        }else{
            birthInfo = "19\(yr == 0 ? "00" : "\(yr)")\(birthInfo)"
        }
        
        
        df.dateFormat = "yyyyMMdd"
        var cd = ""
        if let dd  = df.date(from: birthInfo) {
        df.dateFormat = "dd/MM/YYYY"
         cd = df.string(from: dd)
        }

        //print("DOB :- \(birthInfo) :: \(cd) Gender :- \(genderSt)")
         
         return (genderString , genderSt , cd)
    }
    
    //MARK: Validate Date of Birth with NRIC
    public static func isValidDateOfBirth(_ nricStr : String , dob : String,id_type : Int) -> Bool {
       //var nric = str
       
       var nric = nricStr
       //"801004-75-2245";

       if nric.contains("-") {
          nric = nric.replacingOccurrences(of: "-", with: "")
       }

       if nric.count < 12 && id_type != 1 {
           return true
       }
       //let dob = "04-11-80" //need to convert to yy-mm-dd
       let birthLocArr = [00,17,18,19,20,69,70,73,80,81,94,95,96]
       let nricArr = Array(nric)

       var birthInfo = ""
       var birthLoc = ""
       var gender = ""

       for (index , ch) in nricArr.enumerated() {
           if index <= 5 {
               birthInfo.append(ch)
           }else if index > 5 && index <= 7 {
               birthLoc.append(ch)
           }else if index == 11 {
               gender.append(ch)
           }
       }

       let isInValid = birthLocArr.contains(Int(birthLoc) ?? 0)
       //let genderSt = ((Int(gender) ?? 2) % 2) == 0 ? 2 : 1
       
       let df = DateFormatter()
       df.dateFormat = "dd/MM/yyyy"
       var cd = ""
       if let dd  = df.date(from: dob) {
       df.dateFormat = "yyMMdd"
        cd = df.string(from: dd)
       }

        //print("\((birthInfo == cd) ? "DOB valid" : "DOB not valid" ) ::: \(isInValid ? "Birth loc Invalid" : "Birth loc Valid")")
        
    
       if (birthInfo == cd) {
           
           return true
       }
            
       return false
   }
    // check NRIC Validation
    public static func isValidGender(_ nricStr : String , Cgender : Int,id_type : Int) -> Bool {
       //var nric = str
       
       var nric = nricStr
       //"801004-75-2245";

       if nric.contains("-") {
          nric = nric.replacingOccurrences(of: "-", with: "")
       }

       if nric.count < 12 && id_type != 1 {
           return true
       }
       //let dob = "04-11-80" //need to convert to yy-mm-dd
       let birthLocArr = [00,17,18,19,20,69,70,73,80,81,94,95,96]
       let nricArr = Array(nric)

       var birthInfo = ""
       var birthLoc = ""
       var gender = ""

       for (index , ch) in nricArr.enumerated() {
           if index <= 5 {
               birthInfo.append(ch)
           }else if index > 5 && index <= 7 {
               birthLoc.append(ch)
           }else if index == 11 {
               gender.append(ch)
           }
       }

       let isInValid = birthLocArr.contains(Int(birthLoc) ?? 0)
       let genderSt = ((Int(gender) ?? 2) % 2) == 0 ? 2 : 1
       
        //print("\((birthInfo == cd) ? "DOB valid" : "DOB not valid" ) ::: \(isInValid ? "Birth loc Invalid" : "Birth loc Valid")")
        
    
       if (genderSt == Cgender) {
           
           return true
       }
            
       return false
   }
    
}
