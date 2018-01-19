//
//  RedViewController.swift
//  Screens4
//
//  Created by hackeru on 08/11/2017.
//  Copyright © 2017 iosAgents. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    @IBAction func toYellow(_ sender: Any) {
        let yellow = storyboard!.instantiateViewController(withIdentifier: "yellow")
        
        present(yellow, animated: true, completion: nil)
    }
    
    @IBAction func kill(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
