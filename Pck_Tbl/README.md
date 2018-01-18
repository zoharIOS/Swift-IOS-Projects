# main story board:
(textfield,label,tableview,pickerview)
<img src="https://github.com/zoharIOS/HackerU/blob/master/Pck_Tbl/Pck_Tbl/picker.jpg"  width="400" height="400" />
---
# menu.plist
<img src="https://github.com/zoharIOS/HackerU/blob/master/Pck_Tbl/Pck_Tbl/menu%20plist.PNG"  width="400" height="400" />

# simulator result:
<img src="https://github.com/zoharIOS/HackerU/blob/master/Pck_Tbl/Pck_Tbl/simulator%20picker.PNG"  width="400" height="400" />
---
viewcontroller.swift:
```swift
    import UIKit

    class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource {

    @IBOutlet var ttl:UILabel!
    @IBOutlet var tbl:UITableView!
    
    private var foods: [String:[String]]! //dictionary from plist
    private var titles: [String]! //keys of dictionary
    private var selectedFoods: [String]! //selected array from dictionary
    private var filtered: [String]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "menu", ofType: "plist")!
        foods = NSDictionary(contentsOfFile: path) as! Dictionary
        titles = Array(foods.keys)
        reload(0)
    }
    
    //PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titles[row]
    }
    
    //when selecting title - refresh table and change label
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        reload(row)
    }
    
    //table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        
        cell.textLabel?.text = filtered[indexPath.row]
        
        return cell
    }
    
    private func reload(_ index: Int){
        let title = titles[index]
        selectedFoods = foods[title]
        filtered = selectedFoods
        ttl.text = title
        tbl.reloadData()
    }
    
    //filtering on edit
    @IBAction func filter(_ sender: UITextField) {
        let text = sender.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if text.isEmpty {
            //show all
            filtered = selectedFoods
        } else {
            //filter by text
            filtered = []
            for item in selectedFoods {
                if item.lowercased().contains(text.lowercased()) {
                    filtered.append(item)
                }
            }
        }
        tbl.reloadData()
    }
    
}
```
