import Foundation

public struct MallsResponse: Codable {
    public let  status: String?
    public let  mesaage : String?
    public let  malls: [Mall]?
}

public struct Mall: Codable, Identifiable {
    public let  id: Int?
    public let  name: String?
    public let  about: String?
    public let  contactUs: String?
    public let  defaultMall: Int?
    public let  email: String?
    public let  googleMaps: String?
    public let  icon: String?
    public let  logo: String?
    public let  mallIconWhite: String?
    public let  mallLogoInverse: String?
    public let  phone: String?
    public let  shortDesc: String?
    public let  showDirectory: Int?
    public let  showReceipt: Int?
    public let  textLogo: String?
    public let  waze: String?
    public let  whatsapp: String?
    
    var identifier: Int? { id }
   
    
    enum CodingKeys: String, CodingKey {
        case id, name, about, email, icon, logo, phone, waze, whatsapp
        case contactUs = "contact_us"
        case defaultMall
        case googleMaps = "google_maps"
        case mallIconWhite = "mall_icon_white"
        case mallLogoInverse = "mall_logo_inverse"
        case shortDesc = "short_desc"
        case showDirectory
        case showReceipt
        case textLogo = "text_logo"
    }
}
