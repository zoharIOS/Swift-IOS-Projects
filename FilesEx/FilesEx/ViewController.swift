import UIKit

class ViewController: UIViewController {

    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    var filePath: String!
    var users: [String:String] = [:]
    //user-pass;user-pass;user-pass;user-pass;user-pass;user-pass;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let docs = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                            .userDomainMask,
                                            true)[0]
        filePath = docs + "/users.txt"
        loadUsers(readUsers())
    }


    @IBAction func login() {
        let credi = getTexts()
        if users[credi.user] == credi.pass {
            //login
            print("login good")
            goToSecond()
        } else {
            print("not invalid login..")
        }
    }
    
    @IBAction func regist() {
        let cred = getTexts()
        do {
            try (readUsers() + "\(cred.user)-\(cred.pass);").write(
                toFile: filePath,
                atomically: true,
                encoding: .utf8)
            users[cred.user] = cred.pass
        } catch {
            print("error writing")
        }
    }
    
    private func getTexts() -> (user: String, pass:String) {
        return (user: username.text!, pass: password.text!)
    }
    
    private func readUsers() -> String{
        return (try? String(contentsOfFile: filePath)) ?? ""
    }
    
    private func loadUsers(_ data: String) {
        let usersStr: [Substring] = data.split(separator: ";")
        
        for uStr in usersStr {
            let cred = uStr.split(separator: "-")
            users["\(cred[0])"] = "\(cred[1])"
        }
    }
    
    func goToSecond() {
        let next = storyboard!.instantiateViewController(withIdentifier: "second") as! SecondController
        next.set(users: users)
        next.set(filePath: filePath)
        
        show(next, sender: self)
    }
}
















