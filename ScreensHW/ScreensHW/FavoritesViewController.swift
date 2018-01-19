import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet var greetingSeg: UISegmentedControl!
    
    
    @IBAction func myPrint() {
        let index = greetingSeg.selectedSegmentIndex
        let title = greetingSeg.titleForSegment(at: index)
        
        print(title!)
    }
}
