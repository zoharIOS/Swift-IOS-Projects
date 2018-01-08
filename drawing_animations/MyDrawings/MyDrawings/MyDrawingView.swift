import UIKit

class MyDrawingView: UIView {
    
    override func draw(_ rect: CGRect) {
        //rect => frame => canvas of view
        let w = rect.width, h = rect.height
        print("canvas width: \(w) & height: \(h)")
        
        //CGContext to draw with
        
        let c = UIGraphicsGetCurrentContext()!
        typealias p = CGPoint
        
        /*
        //Example 1 - line
        //starting point
        c.move(to: p(x: 0, y: 0))
        //line to ending point
        c.addLine(to: p(x: w, y: h))
        //how to draw
        c.setStrokeColor(UIColor.red.cgColor)
        c.setLineWidth(CGFloat(3))
        c.strokePath() //draw
        
        / * /
        //Example 2 - fill
        c.move(to: p(x: 10, y: 30))
        //what to draw
        c.addLine(to: p(x: 10, y: 100))
        c.addLine(to: p(x: 150, y: 100))
        c.addLine(to: p(x: 150, y: 30))
        c.addLine(to: p(x: 80, y: 0))
        c.addLine(to: p(x: 10, y: 30))
        //how to draw
        c.setFillColor(UIColor.green.cgColor)
        c.fillPath()
        
        / * /
        //Example 3 - curves
        c.setStrokeColor(UIColor.cyan.cgColor)
        c.setLineWidth(2)
        c.move(to: p(x: 100, y: 250)) //starting point
        let ctrl = p(x: 150, y: 200)
        c.addQuadCurve(to: p(x: 200, y: 250), control: ctrl)
        c.addQuadCurve(to: p(x: 200, y: 150), control: ctrl)
        c.addQuadCurve(to: p(x: 100, y: 150), control: ctrl)
        c.addQuadCurve(to: p(x: 100, y: 250), control: ctrl)
        
        c.strokePath()
 
        / * /
        //Example 4 - arc
        let center = p(x: w / 2, y: h / 2)
        //PI / 180 * degrees
         
        c.addArc(center: center,
                 radius: w / 4,
                 startAngle: CGFloat(Double.pi / 180 * 360),
                 endAngle: CGFloat((Double.pi / 180) * 0),
                 clockwise: true)
        c.setStrokeColor(UIColor.blue.cgColor)
        c.strokePath()
        c.addArc(center: center,
                 radius: w / 6,
                 startAngle: CGFloat(Double.pi),
                 endAngle: 0,
                 clockwise: true)
        c.strokePath()
        / */
        //Example 5
        let points: [[p]] = [
            [p(x: 240, y:0), p(x: 315, y:25)],
            [p(x: 265, y:25), p(x: 265, y:63)],
            [p(x: 265, y:100), p(x: 290, y:100)],
            [p(x: 290, y:120), p(x: 270, y:125)],
            [p(x: 300, y:120), p(x: 305, y:100)],
            [p(x: 365, y:100), p(x: 365, y:63)],
            [p(x: 365, y:25), p(x: 315, y:25)],
        ]
        //Example 6 - img
        let img = UIImage(named: "deadpool")!
        let imgFrame = CGRect(x: 10, y: 10, width: w-20, height: h-20)
        img.draw(in: imgFrame)
        draw(points: points, context: c)
    }
    
    private func draw(points: [[CGPoint]], context c: CGContext){
        c.setLineWidth(3)
        c.move(to: points[0][1])
        for p in points {
            c.addQuadCurve(to: p[1], control: p[0])
        }
        c.strokePath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let t = touches.first! //UITouch object
        let p = t.location(in: self) //CGPoint location in this view
        print("touches at \(p.x) \(p.y)")
    }
}

















