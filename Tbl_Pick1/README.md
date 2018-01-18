[Mytables2](https://github.com/zoharIOS/HackerU/tree/master/Tbl_Pick1/MyTables2)

table view and textfield to filter the table
 <img src="https://github.com/zoharIOS/HackerU/blob/master/Tbl_Pick1/MyTables2/simulator.PNG"  width="200" /> <img src="https://github.com/zoharIOS/HackerU/blob/master/Tbl_Pick1/MyTables2/editing%20changed%20decleration.PNG"  width="200" /> <img src="https://github.com/zoharIOS/HackerU/blob/master/Tbl_Pick1/MyTables2/editing%20changed.PNG"  width="200" /> 

```swift
class ViewController: UIViewController, UITableViewDataSource, UITextViewDelegate {
   
    @IBOutlet var tbl: UITableView!
    
    let items = ["Omri", "Gal", "Nikita", "Nevoa", "Rafael", "Kim"]
    var selectedItems: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedItems = items
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = selectedItems[indexPath.row]
        
        return cell
    }

    //event editing changed
    @IBAction func filter(_ sender: UITextField) {
        //fiter items
        let txt = sender.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if txt.isEmpty {
            //show all items
            selectedItems = items
        } else {
            //filter
            selectedItems = []
            for i in items {
                if i.lowercased().contains(txt.lowercased()) {
                    selectedItems.append(i)
                }
            }
        }
        
        //refresh
        tbl.reloadData()
    }
}
```
---
[TablesEx1](https://github.com/zoharIOS/HackerU/tree/master/Tbl_Pick1/TablesEx1/TablesEx1)
# two controllers, one with tabelview and the other display selected items from the first
 <img src="https://github.com/zoharIOS/HackerU/blob/master/Tbl_Pick1/storyboard.PNG"  width="400" height="400" />

ViewController.swift
```swift
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let names = ["Zohar","Gidon","Yosi","Idan","Bubu","Groot","Deadpool"]
    
    var selectedNames:[String] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let name = names[indexPath.row]
//        let next = storyboard!.instantiateViewController(withIdentifier: "second") as! SecondController
//
//        next.set(msg: name)
//        show(next, sender: self)
        selectedNames.append(names[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let index = selectedNames.index(of: names[indexPath.row])!
        selectedNames.remove(at: index)
    }
    
    @IBAction func goNext(){
        let next = storyboard!.instantiateViewController(withIdentifier: "second") as! SecondController
        
        //pass data
        next.set(names: selectedNames)
        
        show(next, sender: self)
    }
}

```
SecondController.swift
```swift
class SecondController: UIViewController {

    @IBOutlet var ttl: UILabel!
    private var msg: String!
    private var names:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ttl.text = msg
        ttl.text = "\(names!)"
    }
    
    public func set(msg: String) {
        self.msg = msg
    }
    
    public func set(names: [String]){
        self.names = names
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }

}
```
note: at first we selected only one item in the table , pressed the button gonext() and pass with next.set(msg: name)
and later on we enabled multiple selection in the table and passed [String] in selectedNames variable
enable multiple selecetion:
 <img src="https://github.com/zoharIOS/HackerU/blob/master/Tbl_Pick1/multiple%20selection.PNG"  width="400" height="400" />

---

[TablesEx2](https://github.com/zoharIOS/HackerU/tree/master/Tbl_Pick1/TablesEx2/TablesEx2)
# plist  and tableview
items.plist
```swift
<array>
	<dict>
		<key>name</key>
		<string>Coca</string>
		<key>price</key>
		<integer>10</integer>
	</dict>
	<dict>
		<key>name</key>
		<string>Sprite</string>
		<key>price</key>
		<integer>10</integer>
	</dict>
	<dict>
		<key>name</key>
		<string>Bread</string>
		<key>price</key>
		<integer>5</integer>
	</dict>
	<dict>
		<key>name</key>
		<string>Water</string>
		<key>price</key>
		<integer>1</integer>
	</dict>
	<dict>
		<key>name</key>
		<string>Movie Ticket</string>
		<key>price</key>
		<integer>25</integer>
	</dict>
	<dict>
		<key>name</key>
		<string>Protein</string>
		<key>price</key>
		<integer>33</integer>
	</dict>
	<dict>
		<key>name</key>
		<string>Computer</string>
		<key>price</key>
		<real>1500</real>
	</dict>
	<dict>
		<key>name</key>
		<string>Monitor</string>
		<key>price</key>
		<integer>400</integer>
	</dict>
</array>
</plist>
```
viewcontroller.swift
```swift
class ViewController: UIViewController, UITableViewDataSource {
    private var items: [[String: Any]]!
    
    override func viewDidLoad() {
        let path = Bundle.main.path(forResource: "items", ofType: "plist")!
        items = NSArray(contentsOfFile: path) as! [Dictionary]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = items[indexPath.row]
        cell.textLabel?.text = "\(item["name"]!): \(item["price"]!)"
        
        return cell
    }
    
}
```
