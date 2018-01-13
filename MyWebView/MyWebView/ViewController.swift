import UIKit
import SafariServices

class ViewController: UIViewController {

    private let users = ["Omri","Gidon", "Natalia", "Yossi", "Ido", "Shoval", "Sarel"]
    
    @IBOutlet var webView: UIWebView!

    @IBAction func innerData(_ sender: Any) {
        var html = "<h1 id='ttl'>hello from HTML</h1>"
        
        html += "<ul>"
        for u in users{
            html += "<li>\(u)</li>"
        }
        html += "</ul>"
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    
    @IBAction func localFiles(_ sender: Any) {
        let path = Bundle.main.path(forResource: "my", ofType: "html")!
        print(path) //only path without schema
        let url = URL(string: "file://" + path)!
        webView.loadRequest(URLRequest(url: url))
    }
    
    @IBAction func internet(_ sender: Any) {
        let url = URL(string: "http://www.apple.com")!
        webView.loadRequest(URLRequest(url: url))
    }
    
    @IBAction func safariVC(_ sender: Any) {
        let url = URL(string: "http://www.apple.com")!
        let svc = SFSafariViewController(url: url)
        show(svc, sender: self)
    }
    
}
















