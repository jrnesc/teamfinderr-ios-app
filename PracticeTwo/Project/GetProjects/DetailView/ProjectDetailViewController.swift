import UIKit

class ProjectDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var projectDetailTableView: UITableView!
  
  //Overview Labels
  @IBOutlet weak var projectDetailName: UILabel!
  @IBOutlet weak var projectDetailDescription: UILabel!
  @IBOutlet weak var projectDetailMembership: UILabel!
  
  var detailName: String!
  var detailDescription: String!
  var detailMembership: String!
  
  var projectVM = ProjectViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    projectDetailTableView.delegate = self
    projectDetailTableView.dataSource = self
    
    self.projectVM.getProjects()
    self.projectVM.delegate = self
    
    projectDetailName.text = detailName
    projectDetailDescription.text = detailDescription
    projectDetailMembership.text = detailMembership
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let rows = self.projectVM.indexProject.count
    return rows
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectDetailCell", for: indexPath) as? ProjectDetailTableViewCell else {
      fatalError("Cannot dequeue ProjectDetailCell")
  }
    let indexItems = self.projectVM.indexProject[indexPath.row]
    
    if let item = indexItems.memberships {
      for x in 0..<item.count {
        if let itemElements = item[x].user?.username {
          cell.detailUsername.text = itemElements
        } else {
          cell.detailUsername.text = ""
        }
      }
    }
    
    
//    cell.detailUsername.text = indexItems.memberships?[0].user?.username
//    cell.detailRole.text =  indexItems.memberships?[0].role
//    cell.detailCategory.text = indexItems.memberships?[0].category
//    cell.detailUsername.text = "Hello"
    return cell
  }
}


class ProjectDetailTableViewCell: UITableViewCell {
  @IBOutlet weak var detailUsername: UILabel!
  @IBOutlet weak var detailRole: UILabel!
  @IBOutlet weak var detailCategory: UILabel!
  
  
  
}


extension ProjectDetailViewController: ProjectTableReloadDelegate {
  func tableWasReloaded() {
    self.projectDetailTableView.reloadData()
    print("Detail Table reloaded, success")
  }
}
