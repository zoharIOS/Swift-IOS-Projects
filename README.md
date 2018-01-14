# Welcome to IOS projects
----------------------------------
# Summary sheet
----------------------------------
---------------------------------------------------


[AlertExercise](https://github.com/zoharIOS/HackerU/tree/master/AlertExercise)
### Plist :
```swift
        let path = Bundle.main.path(forResource: "users", ofType: "plist")!
        myUsers = NSDictionary(contentsOfFile: path) as! Dictionary // contains username - password key - values
        // asign variables pass , name
        // check ig name & pass exsist in dictionary:
        if pass == myUsers[name] { //if password & user are ok
                //legal user -
            } else {
                //not found in dictionary, illegal user
            }
```   
---
### User defaults
```swift
            private let prefs = UserDefaults.standard
            user = prefs.string(forKey: ViewController.LOG_USER)
            prefs.set(name, forKey: ViewController.LOG_USER)
```
---
### UIALertcontrol
```swift
        let alert = UIAlertController(title: "Login", message: nil, preferredStyle: .alert)
        //text fields
        alert.addTextField(configurationHandler: {(tf) in
        tf.placeholder = "username"
        })

        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "password"
            tf.isSecureTextEntry = true
        })

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

      //action buttons
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: okHandler))
      alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

      //show it
      present(alert, animated: true, completion: nil)
```
more exmples of the same type of alert dialog builder:
[MyAlerts](https://github.com/zoharIOS/HackerU/tree/master/MyAlerts)

---
[MyCustomViews](https://github.com/zoharIOS/HackerU/tree/master/MyCustomViews)
### custom Views :
make a class and then set the button in storyboard with identity inspector to this class
```swift
class MyButton: UIButton {

    override func draw(_ rect: CGRect) {
        layer.backgroundColor = UIColor.magenta.cgColor
        let width = frame.width
        layer.cornerRadius = CGFloat(15)
    }

}
```
in didlviewload change the UIView parameters such as:
```swift
 btn: UIButton!
 btn.layer.borderColor = UIColor.red.cgColor
 btn.setTitleColor(UIColor.red, for: UIControlState.normal)
 section: UIView! 
 section.layer.borderWidth = 2
```
---
[MyDynViews](https://github.com/zoharIOS/HackerU/blob/master/MyDynViews/ViewController.swift)
## dynamic views
make a view using UIView constructor 
```swift
    //origin & size
    let origin = CGPoint(x: 40, y: 20)
    let size = CGSize(width: 50, height: 50)        
    //CGRect => width * height
    let frame = CGRect(origin: origin, size: size)
    let squareView = UIView(frame: frame) 
    // construct directly:
    let ttl = UILabel(frame: CGRect(x: 20, y: 60, width: 150, height: 50))
    ttl.text = "Zohar"
    ttl.textAlignment = .center
    ttl.layer.borderWidth = 1
        
    UILabel(frame: CGRect(x: 20, y: 60, width: 150, height: 50))
 ```
after creating the desired view and adding properties to the look and feel you should add it to a parent groupView, for exmple to the super view:
```swift
    view.addSubview(squareView)
 ```
# The link aboth shows exmples also for UIButton()
---
# build dynamic labels on below of each other in a loop 
 ```swift
    let movies = ["John wick", "John wick Part 2", "Jurassic park", "Freddy Krueger"]
    var y: CGFloat = 20 //reuse y position, start from status bar
    for m in movies {
        let ttl = UILabel()
        ttl.text = m //assign relevant text
        ttl.sizeToFit() //wrap content
        ttl.frame.origin.x = 10 //x position
        ttl.frame.origin.y = y //last stored y position
        y += ttl.frame.height //increment y position
        view.addSubview(ttl) //show to user
    } 
# iterating all subviews in the super view:
    for v in view.subviews { //iterate on all subviews
       if v is UILabel { //each one that is label
          v.removeFromSuperview() //remove
        }
```
---        
[MyGradi](https://github.com/zoharIOS/HackerU/blob/master/MyGradi/ViewController.swift)
## Gradient
 ```swift
 //in iOS gradient is a sort of layer
    let layer = CAGradientLayer()
    //gradient colors
    layer.colors = [
        UIColor.red.cgColor, //start color
        UIColor.blue.cgColor //end color
    ]

    //resuse CGRect of View
    layer.frame = view.frame
    layer.frame.origin = CGPoint(x: 0, y: 0)

    //add gradient layer to existing list of layers of that view
    view.layer.insertSublayer(layer, at: 0)
```
```swift
func grad2(){
        let l = CAGradientLayer()
        l.colors = [
            UIColor.red.cgColor,
            UIColor.blue.cgColor,
            UIColor.red.cgColor,
        ]
        
        //peak points
        l.locations = [0.1, 0.3, 0.8]
        let s = view.frame.size
        l.frame = CGRect(
            origin: CGPoint(x:0, y:0),
            size: CGSize(width: s.width, height: s.height))
        
        view.layer.addSublayer(l)
    }
```
---    
# centering before adding to the super view
 ```swift
 //directions
    let l = layer //(aboth example)
    l.startPoint = CGPoint(x: 0, y: 0)
    l.endPoint = CGPoint(x: 1, y: 1)

    l.frame.size = view.frame.size
    l.frame.origin.x = 0
    l.frame.origin.y = 0
    //center in view
    let s = view.frame.size
    l.frame.size = CGSize(width: s.width / 2, height: s.height / 2)
    l.frame.origin.x = s.width / 4
    l.frame.origin.y = s.height / 4
```
---
## Closure
```swift
 typealias Sequence = (Int)->()
    
    private var sliderValue = 1
    @IBOutlet var timesLbl: UILabel!
    
    var sequence: Sequence!
    let allSequences: [Sequence] = [
        //Fibonacci
        { (times: Int) in
            var small = 1
            var big = 1
            
            for t in 1...times {
                print(small)
                big = big + small
                small = big - small
            }
        } ,
        //Triangular
        { (times: Int) in
            var sum = 0
            for t in 1...times {
                sum += t
                print(sum)
            }
        },
        //Count
        { (times: Int) in
            for t in 1...times {
                print(t)
            }
        }
    ]
    
    @IBAction func seletSequence(_ seg: UISegmentedControl) {
        let index = seg.selectedSegmentIndex
        sequence = allSequences[index]
    }
    @IBAction func slide(_ slider: UISlider) {
        sliderValue = Int(slider.value)
        timesLbl.text = "Times: \(sliderValue)"
    }
    
    @IBAction func go(_ sender: Any) {
        sequence(sliderValue)
    }
    
```
## File System
# CRUD = create, read , update, delete
```swift
class ViewController: UIViewController {

    @IBOutlet var input: UITextField!
    @IBOutlet var output: UILabel!
    
    var docs, filePath, fileName: String!
    let fileMgr = FileManager.default
    
    override func viewDidLoad() {
        //path for documents directory
        let paths = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, //FileManager.SearchDirectory.documentDirectory
            .userDomainMask, //FileManager.SearchPathDomainMask.userDomainMask
            true) //expand tilde (~) to show full path
        docs = paths[0] //first
        print(docs)
        
        fileName = "bubu.txt"
        filePath = docs + "/" + fileName
        print(filePath)
        
        //CRUD
        //  create
        //  read
        //  update
        //  delete
    }
    
    @IBAction func save(_ btn: UIButton) {
        let txt = input.text!
        if txt.isEmpty { return } //if empty - abort
        //c//write from scratch (override content)
        write(string: read() + txt) //append to existing
        input.text = "" //reset input
    }
    
    @IBAction func load(_ btn: UIButton) {
        output.text = read() //load content from file
    }
    
    @IBAction func deleteIt(_ btn: UIButton) {
        //deleteContent()
        deleteFile()
    }
    
    
    private func write(string data: String) {
        do {
            try data.write(toFile: filePath,
                         atomically: true,
                         encoding: .utf8)
        } catch {
            print("Couldn't wirite to file")
        }
    }
    
    private func read() -> String {
//        if let txt = try? String(contentsOfFile: filePath) {
//            return txt
//        } else {
//            return "no data"
//        }
        return (try? String(contentsOfFile: filePath)) ?? ""
    }
    
    //clear file contents
    private func deleteContent() {
        write(string: "")
    }
    
    //remove file entirely
    private func deleteFile(){
        do {
            try fileMgr.removeItem(atPath: filePath)
        } catch {
            print("File Couldn't be deleted")
        }
    }
}
```
# Login , Register , Tsble view , reading from file 
[project: FilesEx](https://github.com/zoharIOS/HackerU/tree/master/FilesEx)
this projet contains two viewcontrollers.
* firt contains two fieldtext for user and password. button for login and register.
for new user & password, pressing register button saves this sequence user-pass to a file.
in didLoad all the content of the file is loaded to a dictionary so each user&pass compare to this content in login button function, and if valid goToSecond view controller.
* second view controllerr contains button "delete All" to delete all users from the file, touch any where in the screen to return back to first controller and a table view to present all the users from the file.
the users and file path are sent from first controller to the second when login function excecute.
attention:
nice function to read from two fields for user & password and return it as a credential (cred.user, cred.pass) struct 
```swift
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
```
---
```swift
class SecondController: UIViewController, UITableViewDataSource {

    @IBOutlet var tbl: UITableView!
    
    private var filePath: String!
    private var users: [String:String]!
    private var uNames: [String] = []
    
    override func viewDidLoad() {
        
        for (key, _) in users {
            uNames.append(key)
        }
        tbl.reloadData()
    }

    public func set(filePath: String){
        self.filePath = filePath
    }
    
    public func set(users: [String: String]){
        self.users = users
    }
    
    @IBAction func deleteAllUsers() {
        try! "".write(toFile: filePath,
                 atomically: true,
                 encoding: .utf8)
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = uNames[indexPath.row]
        
        return cell
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
```
# Asynk Task
```swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        
        async1()
        async2()
        async3()
        async4()
    }

    //Example 1
    func async1(){
        //what to do asynchronously
        DispatchQueue.global(qos: .background).async(execute: {
            print("do in background")
            //usleep(1000000)
            //when need to sync - UI main thread
            DispatchQueue.main.async {
                print("post execute")
            }
        })
    }
    
    func async2() {
        AsyncTask(backgroundTask: {(p:Int) in
            //doing in background
            if p > 0 {
                print("positive")
            }
        }).execute(1)
    }
    
    func async3() {
        AsyncTask(backgroundTask: { (p: Bool) -> Int in
            if p {
                return 100
            }
            return -50
        }, afterTask: { (res: Int) in
            //UI main thread functionality
            print(res)
        }).execute(false)
    }
    
    //Example 4
    func async4(){
        let task = AsyncTask(beforeTask: {
            //in current thread
        }, backgroundTask: { (plist: String) -> [String: [String]] in
            //In background thread
            let path = Bundle.main.path(forResource: plist, ofType: "plist")!
            return NSDictionary(contentsOfFile: path) as! Dictionary
        }, afterTask: { (dict) in
            //In Main thread
            print(dict)
        })
        task.execute("Data") //parameter to pass to backgroundTask closure
    }
}
```











