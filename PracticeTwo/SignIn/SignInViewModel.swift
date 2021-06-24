import Foundation
import Alamofire

class SignInViewModel {
  
  static let shareInstance = SignInViewModel()
  
  func signInAPICall(signIn: SignInModel, completionHandler: @escaping Handler) {
    
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
      "Cookie": "",

    ]
    
    AF.request(signInURL,
               method: .post,
               parameters: signIn,
               encoder: JSONParameterEncoder.default,
               headers: headers)
      .response { response in debugPrint(response)
        
        switch response.result {
          case .success(let data):
            do {
              let json = try JSONSerialization.jsonObject(with: data!, options: [])
              
              if response.response?.statusCode == 200 {
                completionHandler(.success(json))
              } else {
                completionHandler(.failure(.custom(message: "connectivity issue")))
              }
            } catch {
              print(error)
              completionHandler(.failure(.custom(message: "try again")))
            }
          case .failure(let error):
            print(error)
            completionHandler(.failure(.custom(message: "try again")))
          }
      }
  }
}
