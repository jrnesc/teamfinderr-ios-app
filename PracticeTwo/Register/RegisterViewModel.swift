import Foundation
import Alamofire


class RegisterViewModel {
  static let shareInstance = RegisterViewModel()
  
  
  func registerAPICall(register: RegisterModel, completionHandler: @escaping (Bool) -> ()) {
    
    
    let headers: HTTPHeaders = [
      .contentType("application/json")
    ]
    
    AF.request(registerURL,
               method: .post,
               parameters: register,
               encoder: JSONParameterEncoder.default,
               headers: headers)
      .response { response in debugPrint(response)
        
        switch response.result {
          case .success(let data):
            do {
              let json = try JSONSerialization.jsonObject(with: data!, options: [])
              
              if response.response?.statusCode == 201 {
                completionHandler(true)
                print(json)
              } else {
                completionHandler(false)
              }
            } catch {
              print(error)
              completionHandler(false)
            }
          case .failure(let error):
            print(error)
            completionHandler(false)
          }
      }
  }
}


