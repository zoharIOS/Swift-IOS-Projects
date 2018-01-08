//
//  ViewController.swift
//  DrawAnimEx
//
//  Created by hackeru on 08/01/2018.
//  Copyright © 2018 iOSHairDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var oval: MyOvalView!
    var anim: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        anim = UIDynamicAnimator(referenceView: view)
        
        let grav = UIGravityBehavior(items: [oval])
        grav.gravityDirection = CGVector(dx: 0, dy: 0.4)
        anim.addBehavior(grav)
        
        let col = UICollisionBehavior(items: [oval])
        col.translatesReferenceBoundsIntoBoundary = true
        anim.addBehavior(col)
    }
}








