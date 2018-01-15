import UIKit

class FourthController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var ttl:UILabel!
    
    let colors:[UIColor] = [UIColor.red, UIColor.blue, UIColor.cyan]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "row \(indexPath.section):\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ttl.backgroundColor = colors[indexPath.section]
        ttl.text = "row \(indexPath.row)"
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header \(section)"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer \(section)"
    }

}










