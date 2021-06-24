import UIKit

class UserViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Welcome to your dashboard"
    UserViewModel.shareInstance.getUserProfileAPICall()
  
  }
  
  
  
}
