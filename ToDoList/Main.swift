import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableList: UITableView!
    
    var taskList: [Task] = []
  
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableList.dataSource = self
        tableList.delegate = self
        
        taskList = makeTasks()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        var displayText: String = ""
        if(taskList[indexPath.row].important){
            displayText = "‼️\(taskList[indexPath.row].name)"
        }
        else{
            displayText = "\(taskList[indexPath.row].name)"
        }
        cell.textLabel?.text = displayText
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(taskList[indexPath.row].toString())
//        performSegue(withIdentifier: "completeSegue", sender: taskList[indexPath.row])
    }
    
    func makeTasks() -> [Task]{
        var tasksArray:[Task] = []
        
        tasksArray.append(Task(_name:"Halliburton" , _important: true))
        tasksArray.append(Task(_name:"IOS" , _important: true))
        tasksArray.append(Task(_name:"Android" , _important: false))
        tasksArray.append(Task(_name:"Java" , _important: false))
        tasksArray.append(Task(_name:"Pyhton" , _important: true))
        tasksArray.append(Task(_name:"Raspberry pi" , _important: false))
            
        return tasksArray
    }

    @IBAction func addSegue(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! AddTodoTask
        nextVC.main = self
    }

}

