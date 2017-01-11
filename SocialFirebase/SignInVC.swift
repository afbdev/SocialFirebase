//
//  ViewController.swift
//  SocialFirebase
//
//  Created by afbdev on 1/10/17.
//  Copyright © 2017 afbdev. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error != nil) {
                print("Facebook: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("Facebook: User cancelled Facebook Auth")
            } else {
                print("Facebook: Successful Facebook Auth")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("FireBase: Unable to authenticate with Firebase - \(error)")
            } else {
                print("FireBase: Successfully authenticated with Firebase")
                
            }
        })
    }

}

