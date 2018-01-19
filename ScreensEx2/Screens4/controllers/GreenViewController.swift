//
//  GreenViewController.swift
//  Screens4
//
//  Created by hackeru on 08/11/2017.
//  Copyright © 2017 iosAgents. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {

    private var routeFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if routeFlag {
            print("Won")
        }
    }

    
    @IBAction func kill(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    public func onRoute(_ flag:Bool){
        self.routeFlag = flag
    }
}













