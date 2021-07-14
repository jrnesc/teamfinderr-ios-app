import UIKit

class ProfileViewController: UIViewController {
  
  var userVM = UserViewModel()
  
  @IBOutlet weak var usernameProfile: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    DispatchQueue.main.async {
      self.userVM.getUserProfileAPICall()
      self.userVM.delegate = self
      
    }
    
  }
}

extension ProfileViewController: HandOff {
  func setUserUILabel() {
    self.usernameProfile.text = self.userVM.dataUsername
  }
}
