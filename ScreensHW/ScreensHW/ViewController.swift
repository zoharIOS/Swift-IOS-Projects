import UIKit

class ViewController: UIViewController {

    @IBOutlet var txt: UITextView!
    private var msg: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //present message
        for _ in 1...6 {
            txt.text.append("\(msg!)\n")
        }
        
    }

    public func set(msg: String) {
        self.msg = msg
    }
}

