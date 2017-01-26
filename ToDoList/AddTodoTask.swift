
import UIKit

class AddTodoTask: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
   
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var main = MainViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addAction(_ sender: Any) {
        let name = nameField.text!
        let important = importantSwitch.isOn
        let task = Task()
        task.name = name
        task.important = important
        main.taskList.append(task)
        main.tableList.reloadData()
        navigationController!.popViewController(animated: true)
       
    }
       
}
