import UIKit

class MagentaController: UIViewController {

    //works only in navigation controller
    @IBAction func toBlue() {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func toRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    //only works when presenting outside of navigation controller
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
