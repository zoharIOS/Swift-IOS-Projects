import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //grad1()
//        grad2()
        grad3()
    }

    //Example 1
    func grad1(){
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
    }
    
    //Example 2
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
    
    func grad3(){
        let l = CAGradientLayer()
        l.colors = [UIColor.red.cgColor,
                    UIColor.cyan.cgColor]
        
        //directions
        l.startPoint = CGPoint(x: 0, y: 0)
        l.endPoint = CGPoint(x: 1, y: 1)
        
        l.frame.size = view.frame.size
        l.frame.origin.x = 0
        l.frame.origin.y = 0
        
        /*
         //center in view
         let s = view.frame.size
         l.frame.size = CGSize(width: s.width / 2, height: s.height / 2)
         l.frame.origin.x = s.width / 4
         l.frame.origin.y = s.height / 4
         */
        
        view.layer.addSublayer(l)
    }
}



















