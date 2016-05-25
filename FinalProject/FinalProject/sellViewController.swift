//
//  sellViewController.swift
//  FinalProject
//
//  Created by Dennis Pui Yin Lun on 24/5/2016.
//  Copyright © 2016 Dennis Pui Yin Lun. All rights reserved.
//

import UIKit
import Firebase


class sellViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    // Declares the firebase link
    
    var ref = Firebase(url: "https://sizzling-heat-4632.firebaseio.com")
    
    var uid:String = ""

    let imagePicker = UIImagePickerController()
    
    var photoTaken:Bool = false
    var photoData:NSData = NSData()
    

    @IBOutlet weak var uidField: UILabel!
    @IBOutlet weak var inputProductDescription: UITextView!
    @IBOutlet weak var inputPrice: UITextField!
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBOutlet weak var selectedDate: UILabel!
    
    @IBAction func datePickerAction(sender: AnyObject) {
    
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        var strDate = dateFormatter.stringFromDate(myDatePicker.date)
        //self.selectedDate.text = strDate
    
    
    }
    
    
    @IBAction func getPhoto(sender: AnyObject) {
    
        
    imagePicker.sourceType = .PhotoLibrary
    imagePicker.allowsEditing = true
        
    presentViewController(imagePicker, animated: true, completion: nil)

    
    
    }
    
    @IBAction func cancelButton(sender: AnyObject) {
    
    
    }
    @IBAction func enterProductInfo(sender: AnyObject) {
    
        print("photoTaken: " + String(photoTaken))
        print(" inputPrice: " + String(inputPrice.text!))
        
        if let priceEntered = Int(inputPrice.text!) {
        
            if (photoTaken == true) {
            
            var productDescription = inputProductDescription.text!

            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            var strDate = dateFormatter.stringFromDate(myDatePicker.date)
                
            let base64String = photoData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
                
                
            let newProduct = ["UserId":uid, "Description":productDescription, "Price":priceEntered, "Date":strDate, "Image":base64String]
            
                self.ref.childByAppendingPath("ForSale").childByAutoId().setValue(newProduct)
                
                let alertController = UIAlertController(title: "Sell a Product", message:
                    "Product Added!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)

            
            } else
            {
                
            self.uidField.text = "No Photo Taken!"
            
                
            }
            } else
            {
                
            
            self.uidField.text = "No Photo & Price not a number!"
                

            }
            


        
        
        
    
    
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            photoData = UIImageJPEGRepresentation(image,0.1)!
            photoTaken = true
        
        }
        

        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imagePicker.delegate = self
        
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            
        }
        
        
        myDatePicker.minimumDate = NSDate()
        
        if ref.authData != nil {
            
            
            uid = ref.authData.uid
            
            var ref2 = ref.childByAppendingPath("users").childByAppendingPath(uid)
            
            ref2.observeEventType(.Value, withBlock: { snapshot in
                
                    print(snapshot.value.objectForKey("email"))
            
                if let email = snapshot.value.objectForKey("email") {
                    
                    
                    self.uidField.text = email as! String
                    
                }
            })
        } else
        {
            print("not logged in!!")
        }
    

        
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
