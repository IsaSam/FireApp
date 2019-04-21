//
//  HomeViewController.swift
//  FireApp
//
//  Created by Isaac Samuel on 4/20/19.
//  Copyright © 2019 Isaac Samuel. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeViewController: UIViewController {

    @IBOutlet weak var usermail: UILabel!
    @IBOutlet weak var messageField: UITextField!
    
    var ref:DatabaseReference?
 
    override func viewDidLoad() {
        super.viewDidLoad()

        usermail.text = Auth.auth().currentUser?.email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessageButton(_ sender: Any) {
        
        ref = Database.database().reference()
        if messageField.text != ""{
            ref?.child("messages").childByAutoId().setValue(messageField.text)
            messageField.text = ""
        }
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
