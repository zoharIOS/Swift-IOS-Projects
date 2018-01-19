import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get cell from tableviews custom cells bu identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyCustomCell
        
        //we have access to custom views and functions
        //cell.numLbl
        //cell.plusOne()
        
        return cell
    }
}












