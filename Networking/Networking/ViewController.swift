import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameTxt: UITextField!
    @IBOutlet var passTxt: UITextField!
    @IBOutlet var feed: UITextView!
    
    let session = URLSession.shared

    //make sure to confire: NSAppTransportSecurity -> info.plist
    //https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW33
    //Example 1
    @IBAction func req1() {
        //URL to cennect
        let s = "http://nikita.hackeruweb.co.il:80/hackSwift/dugma.txt"
        let url = URL(string: s)!
        //use shared Session to send HTTP Request
        session.dataTask(with: url, completionHandler: {(d, r, e) in //Data, Resposne, Error
            if e == nil { //if there is no error
                print(r!) //response
                print(d!) //raw response body
                let str = String(data: d!, encoding: .utf8)! //convert raw data to String
                print(str) //print readable string
            }
        }).resume() //start(execute) the tast
    }
    
    //Example 2
    @IBAction func req2() {
        //equivalent to first example
        let req = URLRequest(url: URL(string: "http://nikita.hackeruweb.co.il:80/hackSwift/dugma.txt")!)
        session.dataTask(with: req, completionHandler: {(d,r,e) in
            let str = String(data: d!, encoding: .utf8)!
            let names = str.components(separatedBy: ",")//split string by comma
            for n in names {
                print(n)
            }
        }).resume()// dont forget to execute task
    }
    
    //Example 3
    @IBAction func req3() {
        let url = URL(string: "http://nikita.hackeruweb.co.il:80/hackSwift/dugma.txt")!
        //HTTP GET
        session.dataTask(with: url, completionHandler: {(d,r,e) in
            AsyncTask(backgroundTask: {(d: Data) -> String in
                return String(data: d, encoding: .utf8)!
            }, afterTask: {(str) in
                //in UI Main thread
                self.feed.text = str
            }).execute(d!)
        }).resume()
    }
    
    //Example 4
    @IBAction func req4() {
        //sendeing complex request to remote server
        let url = URL(string: "http://nikita.hackeruweb.co.il/hackSwift/")!
        var req = URLRequest(url: url)
        //set request method tp POST
        req.httpMethod="POST"
        //content-type: application/x-www-form-url-encoded
        let params="uName=Bubu&uPass=123"
        //encode and write into request body
        req.httpBody = params.data(using: .utf8)
        session.dataTask(with: req, completionHandler: {(d,r,e) in
            print(r!)
            print(String(data: d!, encoding: .utf8)!)
        }).resume()
    }
    
    @IBAction func req5() {
        let name = nameTxt.text! ,pass = passTxt.text!
        
        if !name.isEmpty && !pass.isEmpty {
            let query = "?alt=json"
            var req = URLRequest(url: URL(string: "http://nikita.hackeruweb.co.il/hackSwift/\(query)")!)
            req.allHTTPHeaderFields = ["Accept": "text/json"]
            req.httpMethod = "POST"
            let params = "uName=\(name)&uPass=\(pass)"
            req.httpBody = params.data(using: .utf8)
            
            session.dataTask(with: req, completionHandler: {(d,r,e) in
                AsyncTask(backgroundTask: {(d: Data) -> String in
                    return String(data: d, encoding: .utf8)!
                }, afterTask: { (str) in
                    self.feed.text = str
                }).execute(d!)
            }).resume()
        }
    }
}

















