import Foundation
import Alamofire


protocol LogOutViewModelType {
  func logOutBtnTapped()
}


class LogOutViewModel: LogOutViewModelType {

    
  
  func logOutBtnTapped() {
    
    self.logOutAPICall() {
      (ifSuccess) in
        if ifSuccess {
          print("Logged out")
        } else {
          print("Something didn't work")
        }
    }
    
  }
    
    
  func logOutAPICall(completionHandler: @escaping (Bool) -> ()) {
    
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
      "Cookie": "",
      ]
    
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

