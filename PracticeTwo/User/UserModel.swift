import Foundation

struct UserModel: Codable {
  var username: String
//  var bio: String
//  var skills: [Skill]
//  var memberships: [ProjectMembership]
  
//  enum CodingKeys: String, CodingKey {
//      case username = "id"
//      case bio = "bio"
//  }
//
//  init(from decoder: Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)
//    username = try values.decodeIfPresent(String.self, forKey: .username)
//    bio = try values.decodeIfPresent(String.self, forKey: .bio)
//
//  }
  
}

//struct Skill: Codable {
//  var name: String
//  var category: String
//}

//struct ProjectMembership: Codable {
//  var role: String
//  var category: String
//}
