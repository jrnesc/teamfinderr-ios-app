import UIKit

class ProfileViewController: UIViewController {
  
  @IBOutlet weak var usernameProfile: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    DispatchQueue.main.async {
      UserViewModel.shareInstance.getUserProfileAPICall()
      UserViewModel.shareInstance.delegate = self
      
    }
    
  }
}

extension ProfileViewController: HandOff {
  func setUserUILabel() {
    self.usernameProfile.text = UserViewModel.shareInstance.dataUsername
  }
}
