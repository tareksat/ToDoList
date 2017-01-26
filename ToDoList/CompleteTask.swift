
import UIKit

class CompleteTask: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    var task : Task? = nil
    var previousVC = MainViewController()
    var selectedIndex = 0
    
    @IBAction func completeTask(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = task!.name
    }
    
}
