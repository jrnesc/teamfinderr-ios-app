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
    //Not sure how to get the tableView to display information relevant to the cell that was clicked.
    //I think it's something to do with the didSelectRowAt() func inside ProjTableVC which handles the detail view for the ViewController
    
    let indexItems = self.projectVM.indexProject[indexPath.row]

    if let item = indexItems.memberships {
      for x in 0..<item.count {
        if let itemCategory = item[x].category {
          cell.detailCategory.text = itemCategory
        } else {
          cell.detailCategory.text = ""
        }
        
        if let itemRole = item[x].role {
          cell.detailRole.text = itemRole
        } else {
          cell.detailRole.text = ""
        }
        
        if let itemUsername = item[x].user?.username {
          cell.detailUsername.text = itemUsername
        } else {
          cell.detailUsername.text = ""
        }
      }
    }
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
