//
//  buyViewController.swift
//  FinalProject
//
//  Created by Dennis Pui Yin Lun on 25/5/2016.
//  Copyright © 2016 Dennis Pui Yin Lun. All rights reserved.
//

import UIKit
import Firebase

class buyViewController: UIViewController, UITableViewDataSource {

    // Declares the firebase link
    
    var ref = Firebase(url: "https://sizzling-heat-4632.firebaseio.com")
    
    var uid = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    var productDescription:[String] = ["Des1"]
    var productPrice:[Int] = [1]
    var productDate:[String] = ["Date1"]
    var productImage:[String] = ["Image1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        
//        if ref.authData != nil {
//            uid = ref.authData.uid
//            
//            ref.childByAppendingPath("ForSale")
//                .observeEventType(.ChildAdded, withBlock: {
//                    snapshot in
//                    
//                    if let content = snapshot.value["Description"] as? String {
//                        self.productDescription.append(content)
//                        
//                        self.tableView.reloadData()
//                    }
//                    
//                    
//                })
//            
//            
//            
//        } else {
//            print("not logged in!!")
//        }
        
        
    }

        
        // Do any additional setup after loading the view.

   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productDescription.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("productCell", forIndexPath: indexPath)
        
        // modify the cell
        cell.labelDescription.text = productDescription[indexPath.row]
        
        
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
