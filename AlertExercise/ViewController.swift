import UIKit

class ViewController: UIViewController {

    public static let LOG_USER = "loggedUser"
    
    @IBOutlet var profileBtn: UIButton!
    private let prefs = UserDefaults.standard
    private var myUsers: [String: String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get data from plist
        let path = Bundle.main.path(forResource: "users", ofType: "plist")!
        myUsers = NSDictionary(contentsOfFile: path) as! Dictionary
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        profileBtn.isHidden = true
        
        if let user = prefs.string(forKey: ViewController.LOG_USER) {
            profileBtn.setTitle(user, for: .normal)
            profileBtn.isHidden = false
        } else {
            //if not
            alertLogin()
        }
    }

    private func alertLogin(){
        let alert = UIAlertController(title: "Login", message: nil, preferredStyle: .alert)
        
        
        func okHandler(action: UIAlertAction) {
            let name = alert.textFields![0].text!
            let pass = alert.textFields![1].text!
            if pass == myUsers[name] { //if password & user are ok
                //legal user -> save in UserDefaults
                prefs.set(name, forKey: ViewController.LOG_USER)
                //set button text & visibility
                profileBtn.setTitle(name, for: .normal)
                profileBtn.isHidden = false
            } else {
                //recursive call - because wrong user
                alertLogin()
            }
        }
        
        //test fields
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "username"
        })
        
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "password"
            tf.isSecureTextEntry = true
        })
        
        //action buttons
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: okHandler))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        //show it
        present(alert, animated: true, completion: nil)
    }
}



















