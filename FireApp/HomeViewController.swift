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

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var usermail: UILabel!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    var myMessage:[String] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        usermail.text = Auth.auth().currentUser?.email
        
        handle = ref?.child("messages").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String
            {
                self.myMessage.append(item)
                self.tableView.reloadData()
            }
        })
    }
    
    @IBAction func sendMessageButton(_ sender: Any) {
        
        //Saving item to database
        if messageField.text != ""{
            ref?.child("messages").childByAutoId().setValue(messageField.text)
            messageField.text = ""
        }
    }
    
    //Setting up our table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMessage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = myMessage[indexPath.row]
        return cell
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
