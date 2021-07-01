import Foundation
import Alamofire

class LogOutViewModel {
  
  static let shareInstance = LogOutViewModel()
  
  func logOutAPICall(completionHandler: @escaping (Bool) -> ()) {
    
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
      "Cookie": "",
    ]
    
//    let task = AF.request(logOutURL, method: .post, headers: headers).response {
//      response in
//          switch response.result {
//            case .success(_): break
//            case .failure(_): print("failed")
//              }
//    print("Hello")
//  }
//    task.resume()
    
    
    let task = AF.request(logOutURL, method: .post, headers: headers)
      .response {
        response in debugPrint(response)
        
        switch response.result {
        case .success(let data):
          do {
            let json = try JSONSerialization.jsonObject(with: data!, options: [])
            
            if response.response?.statusCode == 200 {
              completionHandler(true)
              print(json)
            } else {
              completionHandler(false)
            }
          }
            catch {
              print(error)
              completionHandler(false)
            }
            case .failure(let error):
            print(error)
            completionHandler(false)
          }
        }
    task.resume()
      }
    
    
  }

