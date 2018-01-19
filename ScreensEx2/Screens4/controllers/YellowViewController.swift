//
//  YellowViewController.swift
//  Screens4
//
//  Created by hackeru on 08/11/2017.
//  Copyright © 2017 iosAgents. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {
    
    
    @IBAction func toGreen(_ sender: Any) {
        let green = storyboard!.instantiateViewController(withIdentifier: "green")
        
        show(green, sender: self)
    }
    
    @IBAction func toBlue(_ sender: Any) {
        let blue = storyboard!.instantiateViewController(withIdentifier: "blue") as! BlueViewController
        
        blue.onRoute(routeFlag)
        
        show(blue, sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
    public func onRoute(_ flag:Bool){
        self.routeFlag = flag
    }
    
    private var routeFlag = false
    
}





















