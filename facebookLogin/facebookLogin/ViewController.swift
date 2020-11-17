//
//  ViewController.swift
//  facebookLogin
//
//  Created by Ebrahim  Mo Gedamy on 8/26/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController , LoginButtonDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let token = AccessToken.current,
            !token.isExpired {
            let token = token.tokenString
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields" : "email , name"], tokenString: token, version: nil, httpMethod: .get)
            request.start { (connection, response, error) in
                print("Response : \(response ?? "here")")
            }
        }else{
            let loginButton = FBLoginButton()
            loginButton.center = view.center
            loginButton.delegate = self
            loginButton.permissions = ["public_profile", "email"]
            view.addSubview(loginButton)
        }
       self.view.backgroundColor = #colorLiteral(red: 0.3442881703, green: 0.4943138957, blue: 0.5517072678, alpha: 1)
    }

    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields" : "email ,name"], tokenString: token, version: nil, httpMethod: .get)
        request.start { (connection, response, error) in
            print("Response : \(response ?? "here")")
            
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }

}

