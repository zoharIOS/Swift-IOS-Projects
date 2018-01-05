import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        dyn1()
//        dyn2()
        dyn3()
        dyn4()
    }
    //example 1
    func dyn1(){
        //origin & size
        let origin = CGPoint(x: 40, y: 20)
        let size = CGSize(width: 50, height: 50)
        
        //CGRect => width * height
        let frame = CGRect(origin: origin, size: size)
        let squareView = UIView(frame: frame) //view with given rect
        squareView.backgroundColor = UIColor.red
        
        //squareView.layer.cornerRadius = size.width / 2 //make as circle
        
        view.addSubview(squareView)
    }
    
    //Example 2
    private func dyn2(){
        let ttl = UILabel(frame: CGRect(x: 20, y: 60, width: 150, height: 50))
        ttl.text = "Kim"
        ttl.textAlignment = .center
        ttl.layer.borderWidth = 1
        
        view.addSubview(ttl)
    }
    
    //Example 3
    func dyn3(){
        let btn = UIButton()
        btn.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        btn.setTitle("Dima", for: .normal)
        btn.setTitleColor(UIColor.red, for: .highlighted)
        btn.setTitleColor(UIColor.green, for: .normal)
        btn.sizeToFit() //wrap content
        let vs = view.frame.size
        btn.frame.origin.x = (vs.width - btn.frame.width)/2 //center horizontally
        btn.frame.origin.y = vs.height / 5
        //btn.frame.origin.y = (vs.height - btn.frame.height)/2 //center vertically
        
        view.addSubview(btn)
    }
    
    //example 4
    func dyn4(){
        let movies = ["John wick", "John wick Part 2", "Jurassic park", "Freddy Krueger"]
        
        var y: CGFloat = 20 //reuse y position, start from status bar
        
        for m in movies {
            let ttl = UILabel()
            ttl.text = m //assign relevant text
            ttl.sizeToFit() //wrap content
            ttl.frame.origin.x = 10 //x position
            ttl.frame.origin.y = y //last stored y position
            y += ttl.frame.height //increment y position
            
            view.addSubview(ttl) //show to user
        }
    }
    
    //example 5
    var toggle = false;
    @objc func onClick(btn: UIButton){
        print("clicked")
        
        toggle = !toggle
        if toggle {
            for v in view.subviews { //iterate on all subviews
                if v is UILabel { //each one that is label
                    v.removeFromSuperview() //remove
                }
            }
        } else {
            dyn4()
        }
    }
}




















