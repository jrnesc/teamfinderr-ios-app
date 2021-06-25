import Foundation
import Alamofire

class UserViewModel {
  
  static let shareInstance = UserViewModel()
  
  var delegate: HandOff?
  
  var dataUsername: String?
  
  func getUserProfileAPICall() {
    
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
    ]
    
    let task = AF.request(URL(string: userURL)!, headers: headers).responseDecodable(of: UserModel.self) {
      response in guard let userInfo = response.value else { return }
      
      DispatchQueue.main.async {
        self.dataUsername = userInfo.username
        self.delegate?.setUserUILabel()
        
        print(self.dataUsername)
        print("API call made")
      }
    }
    task.resume()
    
  }
}

protocol HandOff {
  func setUserUILabel()
}
