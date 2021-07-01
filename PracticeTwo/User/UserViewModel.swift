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
        
//        print(self.dataUsername)
        print("API call made")
      }
    }
    task.resume()
  }
  
  
  func addUserSkill(addSkill: Skill, completionHandler: @escaping (Bool) -> ()) {
    
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
    ]
    
    AF.request(registerURL,
               method: .post,
               parameters: addSkill,
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

protocol HandOff {
  func setUserUILabel()
}
