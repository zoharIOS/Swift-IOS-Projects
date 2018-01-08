import UIKit

class MyOvalView: UIView {
    typealias p = CGPoint
    
    override func draw(_ rect: CGRect) {
        let c = UIGraphicsGetCurrentContext()!
        c.setFillColor(UIColor.yellow.cgColor)
//        c.fillEllipse(in: rect)
        let center = p(x: rect.width / 2, y: rect.height / 2)
        c.addArc(center: center, radius: rect.width / 2, startAngle: 0, endAngle: CGFloat(Double.pi / 180 * 360), clockwise: true)
        c.fillPath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        func distance(toPoint p:CGPoint) -> CGFloat {
            var c = CGPoint()
            c.x = frame.width/2
            c.y = frame.height/2
            return sqrt(pow(c.x - p.x, 2) + pow(c.y - p.y, 2))
        }
        let radius = frame.width / 2
        let tl = touches.first!.location(in: self)
        let dis = distance(toPoint: tl)
        
        if dis <= radius {
            UIView.animate(withDuration: 1, animations: {
                self.alpha = 0
            }, completion: { b in
                self.removeFromSuperview()
            })
        }
        
        
    }
}
