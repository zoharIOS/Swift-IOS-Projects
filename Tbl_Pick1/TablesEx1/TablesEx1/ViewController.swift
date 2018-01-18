import UIKit

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
















