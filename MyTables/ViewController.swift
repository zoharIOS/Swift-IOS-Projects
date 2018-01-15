import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    //number fo section (sub lists) - in table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //how many rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    //visual representation of each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = UITableViewCell()
        
        row.textLabel?.text = "Bubu is the king"
        
        return row
    }
}



















