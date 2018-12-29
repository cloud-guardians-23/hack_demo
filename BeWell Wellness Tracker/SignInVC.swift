//
//  ViewController.swift
//  BeWell Wellness Tracker
//
//  Created by Jesica Quinones on 10/28/18.
//  Copyright © 2018 Jesica Quinones. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func onSignInTapped(_ sender: Any) {
            guard let email = emailTF.text,
            email != "",
            let password = passwordTF.text,
            password != ""
                else {
                    AlertController.showAlert(self, title: "Missing Info", message: "Please fill out all required fields")
                    return
                }
       
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
        
            guard let user = user else {return}
            print(user.user.email ?? "MISSING EMAIL")
            print(user.user.displayName ?? "MISSING DISPLAY NAME")
            print(user.user.uid)
        
            
            self.performSegue(withIdentifier: "signInSegue", sender: nil)
        })
        
      
    }
}

