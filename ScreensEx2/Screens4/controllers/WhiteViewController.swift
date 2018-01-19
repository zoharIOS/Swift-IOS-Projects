//
//  WhiteViewController.swift
//  Screens4
//
//  Created by hackeru on 08/11/2017.
//  Copyright © 2017 iosAgents. All rights reserved.
//

import UIKit

class WhiteViewController: UIViewController {

    
    @IBAction func toYellow(_ sender: Any) {
        let yellow = storyboard!.instantiateViewController(withIdentifier: "yellow") as! YellowViewController
        
        yellow.onRoute(true)
        
        show(yellow, sender: self)
    }
    

    @IBAction func toRed(_ sender: Any) {
        let yellow = storyboard!.instantiateViewController(withIdentifier: "red")
        
        show(yellow, sender: self)
    }
}
