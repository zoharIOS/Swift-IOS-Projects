import UIKit

class SecondController: UIViewController {

    @IBOutlet var ttl: UILabel!
    private var msg: String!
    private var names:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ttl.text = msg
        ttl.text = "\(names!)"
    }
    
    public func set(msg: String) {
        self.msg = msg
    }
    
    public func set(names: [String]){
        self.names = names
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }

}



