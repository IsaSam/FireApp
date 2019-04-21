//
//  HomeViewController.swift
//  FireApp
//
//  Created by Isaac Samuel on 4/20/19.
//  Copyright © 2019 Isaac Samuel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {

    @IBOutlet weak var usermail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usermail.text = Auth.auth().currentUser?.email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logOutButton(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "logout", sender: self)
        }
        catch{
            print("couldn't logout")
        }
    }
    

}
