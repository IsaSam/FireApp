//
//  HomeViewController.swift
//  FireApp
//
//  Created by Isaac Samuel on 4/20/19.
//  Copyright © 2019 Isaac Samuel. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
