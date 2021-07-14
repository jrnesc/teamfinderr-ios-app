import UIKit

class ProjectTableViewController: UITableViewController {
  
  var projectVM = ProjectViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "All Projects"
    self.projectVM.getProjects()
    self.projectVM.delegate = self
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let rows = self.projectVM.indexProject.count
    return rows
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectListCell", for: indexPath) as? ProjectTableViewCell else {
      fatalError("Cannot dequeue ProjectTableViewCell")
    }
    let indexItems = self.projectVM.indexProject[indexPath.row]
    cell.projectNameCell.text = indexItems.name
    cell.projectDescriptionCell.text = indexItems.description
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detail: ProjectDetailViewController = self.storyboard?.instantiateViewController(identifier: "ProjectDetailViewController") as! ProjectDetailViewController
    
    
    let detailIndexProjects = self.projectVM.indexProject[indexPath.row]
    detail.detailName = detailIndexProjects.name
    detail.detailDescription = detailIndexProjects.description
    detail.detailMembership = detailIndexProjects.memberships?.count.description
    detail.title = detailIndexProjects.name
    
    self.navigationController?.pushViewController(detail, animated: true)
  }
  
  
  
  
}


class ProjectTableViewCell: UITableViewCell {
  @IBOutlet weak var projectNameCell: UILabel!
  @IBOutlet weak var projectDescriptionCell: UILabel!
}


extension ProjectTableViewController: ProjectTableReloadDelegate {
  func tableWasReloaded() {
    tableView.reloadData()
    print("Success. Table reloaded")
  }
}
