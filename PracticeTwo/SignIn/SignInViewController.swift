import UIKit


class SignInViewController: UIViewController {
  
  
  @IBOutlet weak var usernameSignInTextField: UITextField!
  @IBOutlet weak var emailSignInTextField: UITextField!
  @IBOutlet weak var passwordSignInTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Sign In"
  }
  
  
  @IBAction func signInSubmit(_ sender: Any) {
    guard let uName = self.usernameSignInTextField.text else { return }
    guard let email = self.emailSignInTextField.text else { return }
    guard let pWord = self.passwordSignInTextField.text else { return }
    let signInModel = SignInModel(username: uName, email: email, password: pWord)
    
    SignInViewModel.shareInstance.signInAPICall(signIn: signInModel) { (result) in
      switch result {
      case .success(let json):
        print(json as AnyObject)
        self.showAlert(title: "Success!", message: "Good memory")
      case .failure(let error):
        print(error)
        self.showAlert(title: "Try again...", message: "Something went wrong")
      }
    }
  }
  
}

extension SignInViewController {

  func showAlert(title: String, message: String, action: ((UIAlertAction) -> Void)? = nil) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Okay then", style: .default, handler: action)
    alert.addAction(action)
    self.present(alert, animated: true, completion: nil)
  }
}
