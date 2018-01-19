
import UIKit

class ViewController: UIViewController {

    let MESSAGE = "msg"
    
    @IBOutlet var input: UITextField!
    @IBOutlet var output: UILabel!
    
    let prefs = UserDefaults.standard
    
    
    @IBAction func save() { //save value to user defaults
        prefs.set(input.text!, forKey: MESSAGE)
    }
    
    @IBAction func load() { // load value from your defaults
//        if let msg = prefs.string(forKey: "msg") {
//            output.text = msg
//        } else {
//            output.text = "no message"
//        }
        let msg = prefs.string(forKey: MESSAGE)
        output.text = msg ?? "No message"
    }
    
    @IBAction func del() { //
        prefs.removeObject(forKey: MESSAGE)
    }
}

















