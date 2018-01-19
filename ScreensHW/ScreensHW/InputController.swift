import UIKit

class InputController: UIViewController {

    @IBOutlet var input: UITextField!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "toPresentation" {
            return input.hasText
        }
        
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPresentation" {
            //pass data
            let next = segue.destination as? ViewController
            
            next?.set(msg: input.text!)
        }
    }
}


















