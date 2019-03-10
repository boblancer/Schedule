//
//  ViewController.swift
//  Schedule
//
//  Created by sartsawatj on 2/27/19.
//  Copyright © 2019 boblancer. All rights reserved.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func handleLogin(_ sender: Any) {
        let email = emailField.text
        let password = passwordField.text
        Auth.auth().signIn(withEmail: email!, password: password!){[weak self] user, error in
            guard self != nil else { return }
            
            if error == nil{
                self?.dismiss(animated: false, completion: nil)
            } else {
                print("Login Error\(error!.localizedDescription)")
            }
        }
    }
    
}
