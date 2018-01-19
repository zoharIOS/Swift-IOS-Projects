import UIKit

class MyCustomCell: UITableViewCell {

    private var value: Int = 0
    @IBOutlet weak var numLbl: UILabel!
    
    @IBAction func plusOne(_ sender: UIButton) {
        value += 1
        numLbl.text = "\(value)"
    }
}
