
import UIKit

class ThirdViewController: UIViewController {
  
    
    @IBOutlet weak var inputNumber: UITextField!
    
    @IBOutlet weak var outputText: UILabel!
    
    
    @IBAction func buttonEvenCheckClicked(sender: AnyObject) {
    
    
        var inputNumberText:String = inputNumber.text!
        
        let num:Int? = Int(inputNumberText)
        
        if let numInt = num {
            
            if (numInt % 2) == 1 {
                outputText.text = String(numInt) + " is odd!"
            }
            
            else {
                
                outputText.text = String(numInt) + " is even!"
            }
            
        }
        
    
    
    }
    /*
  TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be shown on the label indicating whether the number is even.
  
  */
}
