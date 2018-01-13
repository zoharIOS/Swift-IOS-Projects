import UIKit

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
        //write(string: txt)//write from scratch (override content)
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
























