//
//  LoginViewController.swift
//  FireApp
//
//  Created by Isaac Samuel on 4/20/19.
//  Copyright © 2019 Isaac Samuel. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailLogin.text!, password: passwordLogin.text!) { (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "login", sender: self)
            }
            else{
                let alert = UIAlertController(title: "There was a problem", message: nil, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    

}
