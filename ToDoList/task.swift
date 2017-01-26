class Task{
    var name: String = ""
    var important: Bool = false
    
    init(_name: String, _important: Bool) {
        self.name = _name
        self.important = _important
    }
    
    func toString() -> String{
        let str = "Name: \(name) & Importance: \(important)"
        return str
    }
}