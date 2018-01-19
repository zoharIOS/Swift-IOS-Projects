import UIKit

class ViewController: UIViewController {

    @IBAction func toYellow(_ btn: UIButton){
        //create instance of ViewController by given String
        let next = storyboard!.instantiateViewController(withIdentifier: "yellow")
        show(next, sender: self)
    }
    
    @IBAction func toRed(_ btn: UIButton){
        //create instance of viewContoller by given string and Cast to RecController
        let next = storyboard!.instantiateViewController(withIdentifier: "red") as! RedController
        
        next.msg = "Bubu is the king"
        present(next, animated: true, completion: nil)
    }
}


















