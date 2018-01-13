import UIKit

class SecondController: UIViewController, UITableViewDataSource {

    @IBOutlet var tbl: UITableView!
    
    private var filePath: String!
    private var users: [String:String]!
    private var uNames: [String] = []
    
    override func viewDidLoad() {
        
        for (key, _) in users {
            uNames.append(key)
        }
        tbl.reloadData()
    }

    public func set(filePath: String){
        self.filePath = filePath
    }
    
    public func set(users: [String: String]){
        self.users = users
    }
    
    @IBAction func deleteAllUsers() {
        try! "".write(toFile: filePath,
                 atomically: true,
                 encoding: .utf8)
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = uNames[indexPath.row]
        
        return cell
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}












