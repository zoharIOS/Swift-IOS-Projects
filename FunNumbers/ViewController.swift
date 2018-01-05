import UIKit

class ViewController: UIViewController {

    typealias Sequence = (Int)->()
    
    private var sliderValue = 1
    @IBOutlet var timesLbl: UILabel!
    
    var sequence: Sequence!
    let allSequences: [Sequence] = [
        //Fibonacci
        { (times: Int) in
            var small = 1
            var big = 1
            
            for t in 1...times {
                print(small)
                big = big + small
                small = big - small
            }
        } ,
        //Triangular
        { (times: Int) in
            var sum = 0
            for t in 1...times {
                sum += t
                print(sum)
            }
        },
        //Count
        { (times: Int) in
            for t in 1...times {
                print(t)
            }
        }
    ]
    
    override func viewDidLoad() {
        sequence = allSequences[0]
    }
    
    @IBAction func seletSequence(_ seg: UISegmentedControl) {
        let index = seg.selectedSegmentIndex
        sequence = allSequences[index]
    }
    
    @IBAction func slide(_ slider: UISlider) {
        sliderValue = Int(slider.value)
        timesLbl.text = "Times: \(sliderValue)"
    }
    
    @IBAction func go(_ sender: Any) {
        sequence(sliderValue)
    }
}

