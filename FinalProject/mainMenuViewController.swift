//
//  mainMenuViewController.swift
//  FinalProject
//
//  Created by Dennis Pui Yin Lun on 25/5/2016.
//  Copyright © 2016 Dennis Pui Yin Lun. All rights reserved.
//

import UIKit
import Firebase

class mainMenuViewController: UIViewController {

    @IBOutlet weak var buyImage: UIImageView!

    @IBOutlet weak var sellImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var imageView = buyImage
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        
        var imageView2 = sellImage
        
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target:self, action:Selector("imageTapped2:"))
        imageView2.userInteractionEnabled = true
        imageView2.addGestureRecognizer(tapGestureRecognizer2)
        
        // Do any additional setup after loading the view.
    }

    func imageTapped(img: AnyObject)
    {
        self.performSegueWithIdentifier("buySegue", sender: self)
        
    }
    
    func imageTapped2(img: AnyObject)
    {
        self.performSegueWithIdentifier("sellSegue", sender: self)
        
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
