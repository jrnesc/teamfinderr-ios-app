import UIKit

class UserViewController: UIViewController {
  
  var logOutVM = LogOutViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Welcome to your dashboard"
  
  }
  
  @IBAction func viewProfile(_ sender: UIButton) {
  }
  
  
  @IBAction func logOutBtn(_ sender: UIButton) {
    logOutVM.logOutBtnTapped()
    
  }
  
  @IBAction func addSkillBtn(_ sender: UIButton) {
//    UserViewModel.shareInstance.addUserSkill(addSkill: <#T##Skill#>, completionHandler: <#T##(Bool) -> ()#>)
  }
  
  
}
