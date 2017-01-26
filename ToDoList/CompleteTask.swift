
import UIKit

class CompleteTask: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    var task  = Task()
    var previousVC = MainViewController()
    var selectedIndex = 0
    
    @IBAction func completeTask(_ sender: Any) {
        previousVC.taskList.remove(at: selectedIndex)
        previousVC.tableList.reloadData()
        navigationController!.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = task.name
    }
    
}
