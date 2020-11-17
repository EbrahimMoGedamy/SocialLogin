//
//  ViewController.swift
//  googleloginIn
//
//  Created by Ebrahim  Mo Gedamy on 8/26/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    
    @IBOutlet var signInBu : GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after lo ading the view.
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
    }
    
    
}

