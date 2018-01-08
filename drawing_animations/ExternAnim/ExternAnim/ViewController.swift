import UIKit

class ViewController: UIViewController {
    //animator -> control animations behavour
    var anim: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set animator to given reference view
        anim = UIDynamicAnimator(referenceView: view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //views to animate
        let rect1 = UIView(frame: CGRect(
            x: view.frame.width/2,
            y: 20,
            width: 60,
            height: 20))
        let rect2 = UIView(frame: rect1.frame)
        let rect3 = UIView(frame: rect1.frame)
        
        //put rect2 & rect 3 on different points
        rect2.frame.origin.x -= 10
        rect2.frame.origin.y = 50
        rect3.frame.origin.y = view.frame.height/2
        
        //set colors
        rect1.backgroundColor = UIColor.red
        rect2.backgroundColor = UIColor.green
        rect3.backgroundColor = UIColor.blue
        
        //add to super view
        view.addSubview(rect1)
        view.addSubview(rect2)
        view.addSubview(rect3)
        
        //Animation behaviours
        //gravity
        let grav = UIGravityBehavior(items: [rect1, rect2])
        grav.gravityDirection = CGVector(dx: 0, dy: 1)
        anim.addBehavior(grav)
        
        //collision
        let col = UICollisionBehavior(items: [rect1, rect2, rect3])
        col.translatesReferenceBoundsIntoBoundary = true
        anim.addBehavior(col)
        
        //elasticity
        let b = UIDynamicItemBehavior(items: [rect1])
        b.elasticity = CGFloat(0.8) //range 0 - 1
        anim.addBehavior(b)
    }

    
}











