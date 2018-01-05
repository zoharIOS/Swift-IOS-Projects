import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var traDialog: UIView! //my dialog
    @IBOutlet var tdMsg: UILabel! //my dialog msg label
    
    //Example 1
    @IBAction func show1() {
        //toggle visibility of the old school dialog
        traDialog.isHidden = !traDialog.isHidden
    }
    
    //Example 2
    @IBAction func show2(_ btn: UIButton) {
        //after iOS 8 (today 11 already) use UIAlertController
        let alert = UIAlertController(title: "Dialog 2", message: "Hello from dialog", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "Ok", //with title "Ok"
                          style: .default, //with default style
                          handler: nil)) //without custom handler
        
        //show alert dialog to user
        show(alert, sender: self)
    }
    
    //Example 3
    @IBAction func show3() {
        let alert = UIAlertController(title: "Dialog 3", message: nil, preferredStyle: .alert)
        
        //add default text field
        alert.addTextField(configurationHandler: nil)
        //add Ok Button
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (alertAction) in
            //get all fields from alert
            let fields = alert.textFields
            //get our text
            let txt = fields![0].text!
            print("OK \(txt)")
            self.showTdMsg(txt)
        }))
        
        //add Cancel Action
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        //show to user
        present(alert, animated: true, completion: nil)
    }
    
    //Example 4
    @IBAction func show4() {
        let alert = UIAlertController(title: "Login", message: nil, preferredStyle: .alert)
        
        var uName, uPass: UITextField!
        
        //add user name text field
        alert.addTextField(configurationHandler: { (input) in
            uName = input
            input.placeholder = "username"
        })
        
        //add user password text field
        alert.addTextField(configurationHandler: { (tf: UITextField) in
            uPass = tf
            uPass.placeholder = "password"
            uPass.isSecureTextEntry = true
        })
        
        //okHandler - defined in the same scope as alert
        func okHandler(alction: UIAlertAction){
            if(uName.text == "Zohar" && uPass.text == "1234") {
                self.showTdMsg("welcome Zohar")
            }
        }
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: okHandler))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    
    private func showTdMsg(_ txt: String) {
        tdMsg.text = txt
        traDialog.isHidden = false
    }
}














