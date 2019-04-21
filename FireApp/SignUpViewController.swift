//
//  SignUpViewController.swift
//  FireApp
//
//  Created by Isaac Samuel on 4/20/19.
//  Copyright © 2019 Isaac Samuel. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailSignUp: UITextField!
    @IBOutlet weak var passwordSignUp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signUpButton(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailSignUp.text!, password: passwordSignUp.text!) { (user, error) in

            if user != nil{
                print("user created")
                self.performSegue(withIdentifier: "login", sender: self)
            }
            else{
                print("error")
            }
            
        }
    }
    

}
