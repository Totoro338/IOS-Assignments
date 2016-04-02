
import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var outputText: UILabel!
    
    @IBOutlet weak var inputName: UITextField!
    
    @IBOutlet weak var inputAge: UITextField!
    
    @IBAction func buttonClicked1(sender: AnyObject) {
    
        outputText.text = "Hello World!"
    
    }
   
    
    
    
   
    @IBAction func buttonClicked2(sender: AnyObject) {
        
        var nameText:String = inputName.text!
        var ageText:String = inputAge.text!
        
        let num:Int? = Int(ageText)
        
        if let ageInt = num {
            
            outputText.text = "Hello " + nameText + ", you are " + ageText + " years old!"
            
        }
        else {
            outputText.text = "Please enter a number for your age!"
        }
        
    }
    
    
    
    @IBAction func buttonClicked3(sender: AnyObject) {
    
        var nameText:String = inputName.text!
        var ageText:String = inputAge.text!
        
        let num:Int? = Int(ageText)
        
        if let ageInt = num {
            
            if ageInt >= 20 {
                
                
                outputText.text = "Hello " + nameText + ", you are " + ageText + " years old!\n"  + "You can drink!"
                
            }
            
            else if ageInt >= 18 {
                
                
                outputText.text = "Hello " + nameText + ", you are " + ageText + " years old!\n" + "You can vote!"
                
            }
            
            else if ageInt >= 16 {
                
                
                outputText.text = "Hello " + nameText + ", you are " + ageText + " years old!\n" + "You can drive!"
                
            }

            else {
                outputText.text = "Hello " + nameText + ", you are " + ageText + " years old!"
            }
            
            
        }
        else {
            outputText.text = "Please enter a number for your age!"
        }
        
    
    
    
    }
    
    @IBAction func buttonClicked4(sender: AnyObject) {
        var nameText:String = inputName.text!
        var ageText:String = inputAge.text!
        
        let num:Int? = Int(ageText)
        
        if let ageInt = num {
            
            if ageInt < 16 {
                
                outputText.text = "Hello " + nameText + ", you are " + ageText + " years old!"
                
                
            }
                
            else if ageInt < 18 {
                
                outputText.text = "Hello " + nameText + ", you are " + ageText + " years old!\n" + "You can drive!"
                
                
                
            }
                
            else if ageInt < 21 {
                
                outputText.text = "Hello " + nameText + ", you are " + ageText + " years old!\n" + "You can drive and vote!"
              
                
            }
                
            else {

                
                outputText.text = "Hello " + nameText + ", you are " + ageText + " years old!\n"  + "you can drive, vote and drink (but not at the same time)!"

            
            }
            
            
        }
        else {
            outputText.text = "Please enter a number for your age!"
        }
        
    
    
    }
    
  /*
  TODO one: hook up the #1 button in interface builder to a new action (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’
  
  TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the #2 button to a NEW action. That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!”
  TODO three: Hook up the #3 button to a NEW action. Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
  TODO four: Hook up the #4 button to a NEW action. Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
  */
}
