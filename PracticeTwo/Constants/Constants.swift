import Foundation

let CSRFToken = ""

let baseURL = "https://teamfinderr.herokuapp.com/api/v1"
let authURL = "\(baseURL)/auth"
let registerURL = "\(authURL)/registration/"
let signInURL = "\(authURL)/login/"
let userURL = "\(authURL)/user/"

enum APIError: Error {
  case custom(message: String)
}

typealias Handler = (Swift.Result<Any?, APIError>) -> Void
