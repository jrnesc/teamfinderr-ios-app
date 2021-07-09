import UIKit


class RegisterViewController: UIViewController {
  
  var registerVM = RegisterViewModel()
  
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var password1TextField: UITextField!
  @IBOutlet weak var password2TextField: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Register"
  }
  
  
  @IBAction func submitRegister(_ sender: UIButton) {
    guard let uName = self.usernameTextField.text else { return }
    guard let email = self.emailTextField.text else { return }
    guard let pWord1 = self.password1TextField.text else { return }
    guard let pWord2 = self.password2TextField.text else { return }
    
    let register = RegisterModel(username: uName, email: email, password1: pWord1, password2: pWord2)
    
    registerVM.registerAPICall(register: register) {
      (ifSuccess) in
      if ifSuccess {
        self.showAlert(title: "Success!", message: "OMG! You're officially a member!")
      } else {
        self.showAlert(title: "Something went wrong", message: "Please try again")
      }
    }
  }
}


extension RegisterViewController {

  func showAlert(title: String, message: String, action: ((UIAlertAction) -> Void)? = nil) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Okay then", style: .default, handler: action)
    alert.addAction(action)
    self.present(alert, animated: true, completion: nil)
  }
}
