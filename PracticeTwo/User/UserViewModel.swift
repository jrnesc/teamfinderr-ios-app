import Foundation
import Alamofire

class UserViewModel {
  
  static let shareInstance = UserViewModel()
  
  var dataUsername: String = ""
  var dataBio: String = ""
  
  
  func getUserProfileAPICall() {
    
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
    ]
    
    AF.request(URL(string: userURL)!, headers: headers).responseDecodable(of: UserModel.self) {
      response in guard let userInfo = response.value else { return }
      
      print(userInfo)
      
    }
   
  }
}

