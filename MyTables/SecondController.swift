import UIKit

class SecondController: UIViewController, UITableViewDataSource {

    //DB simulation
    let stuff: [[String]] = [
        ["Kuba", "Pizza", "Hamburger", "Cuscus", "Hummus", "Pickles"],
        ["iPhone 5", "iPhone X", "LG", "Nokia", "Motorola"],
        ["Apple", "Lemon", "Tomato", "Banana"]
    ]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //section for eacn inner array
        return stuff.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //row for each string
        return stuff[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //assign relevant String by given section & row index
        cell.textLabel?.text = stuff[indexPath.section][indexPath.row]
        return cell
    }
}























