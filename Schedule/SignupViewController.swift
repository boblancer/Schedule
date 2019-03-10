//
//  SignupViewController.swift
//  Schedule
//
//  Created by sartsawatj on 3/9/19.
//  Copyright © 2019 boblancer. All rights reserved.
//

import UIKit
import Firebase
class SignupViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func HandleSignUp(_ sender: Any) {
        guard let username = usernameField.text else {return}
        guard let email = emailField.text else {return}
        guard let password = passwordField.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password){
            user, error in
            if error == nil && user != nil{
                print("created user")
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                changeRequest?.commitChanges{ error in
                    if error == nil {
                        print("User name changed")
                        self.dismiss(animated: false, completion: nil)
                    }
                }
            } else {
                print("Error creating user: \(error!.localizedDescription)")
            }
        }
        
    }
}
