import Foundation


struct SignInModel: Codable {
  var username: String
  var email: String
  var password: String

}


struct TokenHandler: Codable {
  var key: String
}
