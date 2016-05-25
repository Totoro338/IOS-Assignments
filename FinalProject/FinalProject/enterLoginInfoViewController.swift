//
//  enterLoginInfoViewController.swift
//  FinalProject
//
//  Created by Dennis Pui Yin Lun on 21/5/2016.
//  Copyright © 2016 Dennis Pui Yin Lun. All rights reserved.
//

import UIKit
import Firebase

class enterLoginInfoViewController: UIViewController {

    var ref = Firebase(url: "https://sizzling-heat-4632.firebaseio.com")
    

    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var inputFirstName: UITextField!
    @IBOutlet weak var inputLastName: UITextField!
    @IBOutlet weak var inputAddress: UITextView!
    @IBOutlet weak var inputCountry: UITextField!
    @IBOutlet weak var inputPhone: UITextField!
    
    
    @IBAction func buttonEnter(sender: AnyObject) {
    
        
        let email:String = inputEmail.text!
        let password:String = inputPassword.text!
        
        let firstName:String = inputFirstName.text!
        let lastName:String = inputLastName.text!
        let address:String = inputAddress.text!
        let country:String = inputCountry.text!
    
        
        ref.createUser(email, password: password, withCompletionBlock: {
            
            error in
            
            if (error != nil) {
                
                print(error)
                
            } else {
                
                print("it worked")
                
                self.ref.authUser(email, password: password, withCompletionBlock: {
                    error, authData in
                    
                    if(error != nil) {
                        print(error.code)
                        
                        if let errorCode = FAuthenticationError(rawValue: error.code) {
                            
                            if (errorCode == FAuthenticationError.UserDoesNotExist) {
                                
                                print("no such user")
                                
                            }
                            
                            switch (errorCode) {
                                
                            case .UserDoesNotExist:
                                print("no such user")
                                
                            case .InvalidEmail:
                                print("invalid email")
                            default:
                                print("unknown error")
                                
                            }
                            
                        }
                        
                    } else {
                        
                        print(authData.uid)
                        
                        //Create the record into firebase
                        
                        let newUser = ["email":email, "firstName":firstName, "lastName":lastName, "address":address, "country":country]
                        
                        
                        self.ref.childByAppendingPath("users").childByAppendingPath(authData.uid).setValue(newUser)
                        
                        
                        print("Success Signup")
                        
                        self.ref.unauth()
                        
                        self.dismissViewControllerAnimated(true, completion: nil)
                        
                        
                        //self.messageLabel.text = "User Created Successfully! Please login now!"
                        
                        
                        //self.performSegueWithIdentifier("loginSegue", sender: self)
                        
                        
                        
                    }
                    
                })
                
            }
        })
        

        
    }
   
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
