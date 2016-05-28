//
//  buyViewController.swift
//  FinalProject
//
//  Created by Dennis Pui Yin Lun on 25/5/2016.
//  Copyright © 2016 Dennis Pui Yin Lun. All rights reserved.
//

import UIKit
import Firebase

class buyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Declares the firebase link
    
    var ref = Firebase(url: "https://sizzling-heat-4632.firebaseio.com")
    
    var uid = ""
    var selectedRow:Int = -1

   
   
    @IBOutlet weak var tableView: UITableView!
    
    var productDescription:[String] = []
    var productPrice:[Int] = []
    var productDate:[String] = []
    var productImage:[String] = []
    var productAutoID:[String] = []
    
    
    @IBAction func buyItem(sender: AnyObject) {
        buyItemProcess()
        }
    
    func buyItemProcess()
    {
        print(selectedRow)
        
        uid = ref.authData.uid
        
        if selectedRow != -1 {
        
        //print(ref.childByAppendingPath("ForSale").value[productAutoID[selectedRow]])
        
        let soldProduct = ["BuyerUserId":uid, "Description":productDescription[selectedRow], "Price":productPrice[selectedRow], "Date":productDate[selectedRow], "Image":productImage[selectedRow]]
         
        self.ref.childByAppendingPath("Sold").childByAppendingPath(productAutoID[selectedRow]).setValue(soldProduct)
            
       self.ref.childByAppendingPath("ForSale").childByAppendingPath(productAutoID[selectedRow]).removeValue()
        productDescription.removeAtIndex(selectedRow)
        productPrice.removeAtIndex(selectedRow)
        productDate.removeAtIndex(selectedRow)
        productImage.removeAtIndex(selectedRow)
        productAutoID.removeAtIndex(selectedRow)
        
        selectedRow = -1
            
        self.tableView.reloadData()
    
            
            //ref.childByAppendingPath("ForSale").childByAppendingPath([productAutoID[selectedRow]).setvalue(
        
        
        }
    }

    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            print("Swipe Left")
        }
        
        if (sender.direction == .Right) {
            print("Swipe Right")

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        if ref.authData != nil {
            uid = ref.authData.uid
            
            ref.childByAppendingPath("ForSale")
                .observeEventType(.ChildAdded, withBlock: {
                    snapshot in
                    
                    if let content = snapshot.value["Description"] as? String {
                        self.productDescription.append(content)
                    }
                    
                    if let content = snapshot.value["Price"] as? Int {
                        self.productPrice.append(content)
                    }
                    
                    if let content = snapshot.value["Date"] as? String {
                        self.productDate.append(content)
                    }
                    
                    if let content = snapshot.value["Image"] as? String {
                        self.productImage.append(content)
                    }

                    if let content = snapshot.key as? String {
                        self.productAutoID.append(content)
                    }

                    self.tableView.reloadData()
                    
                })
            
 
            var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
            var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
            
            leftSwipe.direction = .Left
            rightSwipe.direction = .Right
            
            
            

            
            
        } else {
            print("not logged in!!")
        }
        
        
    }


    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("didSelectRowAtIndexPath function called")
        selectedRow = indexPath.row
        print(selectedRow)
        print("AutoID \(productAutoID[selectedRow])")
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productDescription.count;
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("productCell", forIndexPath: indexPath)
        
        
        if let cell = cell as? ProductTableViewCell {
            cell.labelDescription.text = productDescription[indexPath.row]
            cell.labelPrice.text = "$ " + String(productPrice[indexPath.row])
            cell.labelDate.text = "Arrive on " + productDate[indexPath.row]
            let imageData = NSData(base64EncodedString: productImage[indexPath.row] as! String,
                                   options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
            let decodedImage = UIImage(data:imageData!)
            cell.productImage.image = decodedImage
            

        }
        
        return cell
        
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
