import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    private var items: [[String: Any]]!
    
    override func viewDidLoad() {
        let path = Bundle.main.path(forResource: "items", ofType: "plist")!
        items = NSArray(contentsOfFile: path) as! [Dictionary]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = items[indexPath.row]
        cell.textLabel?.text = "\(item["name"]!): \(item["price"]!)"
        
        return cell
    }
    
}

