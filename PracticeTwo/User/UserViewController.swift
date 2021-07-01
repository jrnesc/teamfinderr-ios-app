import UIKit

class UserViewController: UIViewController {
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Welcome to your dashboard"
  
  }
  
  @IBAction func viewProfile(_ sender: UIButton) {
  }
  
  
  @IBAction func logOutBtn(_ sender: UIButton) {
    LogOutViewModel.shareInstance.logOutAPICall() {
      (ifSuccess) in
      if ifSuccess {
        print("Logged out")
      } else {
        print("Something didn't work")
      }
    }
  }
  
  @IBAction func addSkillBtn(_ sender: UIButton) {
//    UserViewModel.shareInstance.addUserSkill(addSkill: <#T##Skill#>, completionHandler: <#T##(Bool) -> ()#>)
  }
  
}
