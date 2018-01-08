import UIKit

class ViewController: UIViewController {
    let e = MyErrors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Example 1
        do {
            //can have multiple tries in the same block
            try e.notRealyBad()
            try e.doSomeBad()
            
            //success handling
            
        } catch {
            //failure handling
            print("error handler")
        }
        
        //Example 2 - muliple catch block
        do {
            try e.goToWork()
        } catch MyErrors.WorkError.isSunday {
            print("return to sleep")
        } catch MyErrors.WorkError.notEnoughSleep {
            print("Drink more coffee")
        } catch MyErrors.WorkError.notEnoughCoffee {
            print("at this point there is not much you can do")
        } catch {
            print("another error")
        }
        
        //Example 3
        do {
            try e.badAndClean()
        } catch { }
        
        //Example 4 - inline syntax
        try! e.badOrNot() //if thrown - crash
        try? e.badOrNot() //if thrown - return nil
        
    }
    
    
    @IBAction func bad(_ sender: Any) {
        do {
            try e.doSomeBad()
        } catch {
            print("bad catched..")
        }
    }
    
    @IBAction func notBad(_ sender: Any) {
        try? e.notRealyBad()
    }
    
    @IBAction func badOrNot(_ sender: Any) {
        try! e.badOrNot()
    }
}









