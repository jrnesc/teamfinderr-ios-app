import UIKit


class SkillsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  
  var userVM = UserViewModel()
  
  @IBOutlet weak var skillNameTextField: UITextField!
  @IBOutlet weak var categoryPicker: UIPickerView!
  
  var categoryData: [String] = [String]()
  var selectedPicker: String?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.categoryPicker.delegate = self
    self.categoryPicker.dataSource = self
    
    title = "Skills"
    
    categoryData = ["Communication", "Technical", "Analytical", "Relationship", "Management", "Creative"]
  }
  
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return categoryData.count
  }
  
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return categoryData[row]
  }
  
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    switch pickerView {
    case categoryPicker:
      self.selectedPicker = categoryData[row]
    default:
      break
    }
    
  }
  
  
  @IBAction func addSkillPOST(_ sender: UIButton) {
    guard let sName = self.skillNameTextField.text else { return }
    guard let cPicker = self.selectedPicker else { return }
    
    let skills = Skill(name: sName, category: cPicker)
    
    self.userVM.addUserSkill(addSkill: skills) {
      (ifSuccess) in
      if ifSuccess {
        print("cook")
      } else {
        print("not cook")
        }
    }
  
  }
}
