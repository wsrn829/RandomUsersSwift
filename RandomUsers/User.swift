import Foundation

struct Response: Decodable {
    let users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
    }
}

struct User: Decodable, Identifiable {
    let id: String
    let name: Name
    
    struct Name: Decodable {
        let title: String
        let first: String
        let last: String
    }
    
    var fullName: String {
       return "\(name.title). \(name.first) \(name.last)"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(Name.self, forKey: .name)
        let loginInfo = try values.nestedContainer(keyedBy: LoginInfoCodingKeys.self,
                                                     forKey: .login)
        id = try loginInfo.decode(String.self, forKey: .uuid)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case login
    }
    enum LoginInfoCodingKeys: String, CodingKey {
        case uuid
    }
}
