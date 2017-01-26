import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableList: UITableView!
    
    var taskList: [Task] = []
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableList.dataSource = self
        tableList.delegate = self
        
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        var displayText: String = ""
        if(taskList[indexPath.row].important){
            displayText = "‼️\(taskList[indexPath.row].name!)"
        }
        else{
            displayText = "\(taskList[indexPath.row].name!)"
        }
        cell.textLabel?.text = displayText
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let task = taskList[indexPath.row]
        performSegue(withIdentifier: "completeSegue", sender: task)
    }
    
    
    
    @IBAction func addSegue(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    
    func getTasks(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            taskList =  try context.fetch(Task.fetchRequest()) as! [Task]
            print(taskList)
        }
        catch{
            print("we have an error!")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableList.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
                    }
        else{
            let completeTask = segue.destination as! CompleteTask
            
            completeTask.task = sender as? Task
//            completeTask.previousVC = self
            
        }
    }
    
}

