import UIKit

class BlueController: UIViewController {

    @IBAction func toMagenta(_ sender: UIButton) {
        let next = storyboard!.instantiateViewController(withIdentifier: "magenta")
        
        //push next screen with navigation controller
        //*
        navigationController!.pushViewController(next, animated: true)
        /*/
        //present next screen without navigation controller
        present(next, animated: true, completion: nil)
        // */
    }
    
    @IBAction func prev(_ sender: UIButton) {
        //go back to previous screen
        navigationController!.popViewController(animated: true)
    }
    
}
