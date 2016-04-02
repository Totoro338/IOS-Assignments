
import UIKit

class SecondViewController: UIViewController {
  
  
    var numTotal:Int = 0
    
    
    @IBOutlet weak var inputNumber: UITextField!
    
    @IBOutlet weak var outputSumTotal: UILabel!
    
    
    @IBAction func buttonAddClicked(sender: AnyObject) {
    
        var numberInputText:String = inputNumber.text!
        
        let num:Int? = Int(numberInputText)
        
    
        if let numInt = num {
            
            numTotal += numInt
            
            print(numTotal)
            
            outputSumTotal.text = String(numTotal)
            
        }
    
    }
    
    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
}
