import UIKit

class ViewController: UIViewController {

    // bubu - 123
    // groot - I am
    @IBOutlet var userTxt: UITextField!
    @IBOutlet var passTxt: UITextField!
    
    private let users: [String : String] = [
        "bubu": "123",
        "groot": "I am"
    ]
    
    @IBAction func login(_ sender: Any) {
        
        //if correct login
        if users[userTxt.text!] == passTxt.text {
            let main = storyboard!.instantiateViewController(withIdentifier: "main")
            show(main, sender: self)
        }
    }
    

}

