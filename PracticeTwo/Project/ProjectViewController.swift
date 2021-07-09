import UIKit

class ProjectViewController: UIViewController {
  
  var projectVM = ProjectViewModel()
  
  
  @IBOutlet weak var projectNameTextField: UITextField!
  @IBOutlet weak var projectDescriptionTextField: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Projects"
    
  }
  
  
  @IBAction func createProjectBtn(_ sender: UIButton) {
    guard let projName = self.projectNameTextField.text else { return }
    guard let projDescription = self.projectDescriptionTextField.text else { return }
    
    let ProjectItems = Project(name: projName, description: projDescription)
    
    projectVM.addProject(createProject: ProjectItems) {
      (ifSuccess) in
      if ifSuccess {
        self.showAlert(title: "Success!", message: "OMG! You created a project!")
      } else {
        self.showAlert(title: "Something went wrong", message: "Please try again")
      }
    }
  }
  
  
}

extension ProjectViewController {

  func showAlert(title: String, message: String, action: ((UIAlertAction) -> Void)? = nil) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Okay then", style: .default, handler: action)
    alert.addAction(action)
    self.present(alert, animated: true, completion: nil)
  }
}
