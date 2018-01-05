import UIKit

class ViewController: UIViewController {

    @IBOutlet var btn: UIButton!
    @IBOutlet var section: UIView!
    
    override func viewDidLoad() {
        cust1()
        cust2()
    }

    private func cust1(){
        print(btn.frame.width)
        print(btn.frame.height)
        btn.layer.borderColor = UIColor.red.cgColor
        btn.layer.borderWidth = CGFloat(3)
    }
    
    private func cust2(){
        section.layer.borderWidth = 2
        section.layer.cornerRadius = 20
    }
}
















