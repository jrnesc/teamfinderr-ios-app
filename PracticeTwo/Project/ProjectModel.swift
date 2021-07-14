import Foundation

struct Project: Codable {
  var id: Int?
  var name: String
  var description: String
  var memberships: [Membership]?

}


struct Membership: Codable {
    var id: Int
    var role: String?
    var category: String?
    var user: User?
}


struct User: Codable {
    var id: Int
    var username: String?
}
