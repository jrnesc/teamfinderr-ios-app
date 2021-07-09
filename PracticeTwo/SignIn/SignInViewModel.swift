import Foundation
import Alamofire


protocol TokenDelegate {
  
  func tokenAssign(x: String)
  func getToken() -> String
}


extension SignInViewModel: TokenDelegate {
  
  func tokenAssign(x: String) {
    userDefault.set(x, forKey: "key")
  }
  
  
  func getToken() -> String {
    if let xToken = userDefault.object(forKey: "key") as? String{
      return xToken
    } else {
      return ""
    }
  }
}


class SignInViewModel {
  
  var delegate: TokenDelegate?
  
  let userDefault = UserDefaults.standard
  
  func signInAPICall(signIn: SignInModel, completionHandler: @escaping Handler) {
    self.delegate = self
    
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
      "Cookie": "",
    ]
    
    let task = AF.request(signInURL,
               method: .post,
               parameters: signIn,
               encoder: JSONParameterEncoder.default,
               headers: headers)
      .response { response in debugPrint(response)
        
        switch response.result {
          case .success(let data):
            do {
              let json = try JSONDecoder().decode(TokenHandler.self, from: data!)
              self.delegate?.tokenAssign(x: json.key)
              
              if response.response?.statusCode == 200 {
                completionHandler(.success(json))
              } else {
                completionHandler(.failure(.custom(message: "connectivity issue")))
              }
            } catch {
              completionHandler(.failure(.custom(message: "try again")))
            }
          case .failure(let error):
            print(error)
            completionHandler(.failure(.custom(message: "try again")))
        }
      }
    task.resume()
  }
}
