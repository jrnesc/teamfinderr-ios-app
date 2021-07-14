import Foundation
import UIKit
import Alamofire

protocol ProjectTableReloadDelegate {
  func tableWasReloaded()
}


class ProjectViewModel {
  
  var signInVM = SignInViewModel()
  
  var indexProject: [Project] = []
  var indexCounter: Int?
  
  var delegate: ProjectTableReloadDelegate?
  
  func addProject(createProject: Project, completionHandler: @escaping (Bool) -> ()) {
    
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
      "Authorization": "Token \(signInVM.getToken())"
      
    ]
    
    AF.request(projectsURL,
               method: .post,
               parameters: createProject,
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
  
  
  func getProjects() {
    
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
      "Authorization": "Token \(signInVM.getToken())",
    ]
    
    let task = AF.request("https://teamfinderr.herokuapp.com/api/v1/projects/", headers: headers).responseDecodable(of: [Project].self) {
      response in guard let projectResult = response.value else { return }
//      print(projectResult)
      
      self.indexProject.append(contentsOf: projectResult)
      self.delegate?.tableWasReloaded()
      
      self.indexCounter = self.indexProject.count
      
//      for i in 0..<counter {
//        if let item = self.indexProject[i].memberships {
//          for x in 0..<item.count {
//            if let itemMembers = item[x].user?.username {
//              print(itemMembers)
//            } else {
//              print("First fail")
//            }
//          }
//
//        } else {
//          print("Failed")
//        }
//
//      }
      
//      print(self.indexProject)
      
    }
    task.resume()
    
  }
  
}


