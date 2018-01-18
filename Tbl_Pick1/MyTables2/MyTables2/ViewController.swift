import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITextViewDelegate {
   
    @IBOutlet var tbl: UITableView!
    
    let items = ["Omri", "Gal", "Nikita", "Nevoa", "Rafael", "Kim"]
    var selectedItems: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedItems = items
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = selectedItems[indexPath.row]
        
        return cell
    }

    //event editing changed
    @IBAction func filter(_ sender: UITextField) {
        //fiter items
        let txt = sender.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if txt.isEmpty {
            //show all items
            selectedItems = items
        } else {
            //filter
            selectedItems = []
            for i in items {
                if i.lowercased().contains(txt.lowercased()) {
                    selectedItems.append(i)
                }
            }
        }
        
        //refresh
        tbl.reloadData()
    }
}





















