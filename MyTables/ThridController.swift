import UIKit

class ThridController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "section:\(indexPath.section), row:\(indexPath.row)"
        return cell
    }
    
    
    //delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected at section:\(indexPath.section) row:\(indexPath.row)")
    }
}
















