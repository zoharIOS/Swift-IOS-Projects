import UIKit

class GreenController: UIViewController {
    
    @IBAction func toRed(){
        //pop to previous screen
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func toBlue(){
        //push to next screen
        let next = storyboard!.instantiateViewController(withIdentifier: "blue")
        
        show(next, sender: self)
    }

}
