import Foundation

//let CSRFToken = ""

let baseURL = "https://teamfinderr.herokuapp.com/api/v1"
let authURL = "\(baseURL)/auth"
let registerURL = "\(authURL)/registration/"
let signInURL = "\(authURL)/login/"
let userURL = "\(authURL)/user/"
let logOutURL = "\(authURL)/logout/"

let addSkill = "\(userURL)/add-skill/"


enum APIError: Error {
  case custom(message: String)
}

typealias Handler = (Swift.Result<Any?, APIError>) -> Void
