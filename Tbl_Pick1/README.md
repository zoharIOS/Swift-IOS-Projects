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
