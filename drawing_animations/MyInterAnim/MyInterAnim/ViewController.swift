
import UIKit

class ViewController: UIViewController {
    @IBOutlet var section: UIView!
    @IBOutlet var footer: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        /*
        //Example 1
        UIView.animate(withDuration: 1.5, animations: {
            self.section.alpha = 0 //fade out
        })
        / * /
        //Example 2
        func changeFooter(){
            footer.backgroundColor = UIColor.yellow
        }
        UIView.animate(withDuration: 2.25, animations: changeFooter)
        * /
        
        //Example 3
        UIView.animate(withDuration: 1.8, animations: {
            //width = 50%, height = 200%
            let tranform = CGAffineTransform(scaleX: 0.5, y: 2.0)
            self.footer.transform = tranform
        })
        * /
        
        //Example 4
        UIView.animate(withDuration: 2.1, animations: {
            self.section.backgroundColor = UIColor.magenta
        }, completion: { (b) in //when animation completed
            self.footer.backgroundColor = UIColor.red
        })
        // * /
        
        //Example 5
        UIView.animate(withDuration: 1, animations: {
            //PI / 180 * degrees -> dergrees to rotate
            let halfTurn = CGFloat(Double.pi / 180 * 90) //degrees
            let t = CGAffineTransform(rotationAngle: halfTurn) //rotation object
            self.section.transform = t.concatenating(CGAffineTransform(translationX: 150, y: 0))
        })
        // */
        //Example 6 - animation chain
        let x = self.view.frame.width / 4
        let tx = CGAffineTransform(translationX: x, y: 0) //transformation obj
        UIView.animate(withDuration: 2, animations: {
            self.footer.transform = tx
        }, completion: { b in
            //another animation
            UIView.animate(withDuration: 1.5, animations: {
                self.footer.backgroundColor = UIColor.yellow
            })
        })
    }
}






















