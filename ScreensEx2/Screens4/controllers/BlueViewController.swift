//
//  BlueViewController.swift
//  Screens4
//
//  Created by hackeru on 08/11/2017.
//  Copyright © 2017 iosAgents. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    
    private var routeFlag = false

    @IBAction func toGreen(_ sender: Any) {
        let green = storyboard!.instantiateViewController(withIdentifier: "green") as! GreenViewController
        
        //present(green, animated: true, completion: nil)
        green.onRoute(routeFlag)
        show(green, sender: self)
    }
    

    @IBAction func kill(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    public func onRoute(_ flag:Bool){
        self.routeFlag = flag
    }
}







