import UIKit

class ViewController: UIViewController {

    @IBOutlet var ttl: UILabel!
    
    let bundle = Bundle.main
    var themes: [String: [String: [CGFloat]]] = [:]
    
    override func viewDidLoad() {
        //Example 1
        ex1()
        
        //Example 2
        ex2()
    }

    
    func ex1() {
        let path = bundle.path(forResource: "students", ofType: "plist")!
        //print(path)
        
        let students = NSArray(contentsOfFile: path) as! [String]
        for s in students {
            print(s)
        }
    }
    
    func ex2() {
        themes = NSDictionary(contentsOfFile: bundle.path(forResource: "themes", ofType: "plist")!) as! Dictionary
        let cs = themes["Groot"]!["bgColor"]!
        
        view.backgroundColor = UIColor(red: cs[0], green: cs[1], blue: cs[2], alpha: cs[3])
    }
    @IBAction func reTheme(_ btn: UIButton) {
        let th = themes[btn.currentTitle!]!
        let bgc = th["bgColor"]!,
            tc = th["txtColor"]!
        
        ttl.textColor = UIColor(red: tc[0], green: tc[1], blue: tc[2], alpha: tc[3])
        ttl.backgroundColor = UIColor(red: bgc[0], green: bgc[1], blue: bgc[2], alpha: bgc[3])
    }
}























