//
//  ViewController.swift
//  FinalProject
//
//  Created by Dennis Pui Yin Lun on 18/5/2016.
//  Copyright © 2016 Dennis Pui Yin Lun. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    
    // Declares the firebase link
    
    var ref = Firebase(url: "https://sizzling-heat-4632.firebaseio.com")

    
    // Used to unwind the segway
    @IBAction func unwindSegue(segue:UIStoryboardSegue) {
        
    }
    
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    @IBAction func buttonSignIn(sender: AnyObject) {
    
        let email:String = inputEmail.text!
        let password:String = inputPassword.text!
    
        self.ref.authUser(email, password: password, withCompletionBlock: {
            error, authData in
            
            if(error != nil) {
                print(error.code)
                
                if let errorCode = FAuthenticationError(rawValue: error.code) {
                    
                    if (errorCode == FAuthenticationError.UserDoesNotExist) {
                        
                        print("no such user")
                        self.messageLabel.text = "No Such User"
                    }
                    
                    switch (errorCode) {
                        
                    case .UserDoesNotExist:
                        print("no such user")
                        self.messageLabel.text = "No Such User"
                        
                    case .InvalidEmail:
                        print("invalid email")
                        self.messageLabel.text = "Invalid Email"
                    default:
                        print("unknown error")
                          self.messageLabel.text = "Unknown Error"
                        
                    }
                    
                }}
                else {
                        self.messageLabel.text = "Success!"
                    self.performSegueWithIdentifier("loginSegue", sender: self)
                    
                }
                
            
            
        })
    }
    
    
            
    
    
      

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

