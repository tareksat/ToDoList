
import UIKit

class AddTodoTask: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
   
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addAction(_ sender: Any) {
        let name = nameField.text
        let important = importantSwitch.isOn
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = name!
        task.important = important
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        navigationController!.popViewController(animated: true)
       
    }
       
}
