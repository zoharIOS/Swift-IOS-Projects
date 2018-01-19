import UIKit

class RedController: UIViewController {

    private var _msg : String!
    
    override func viewDidLoad() {
        print(_msg)
    }
    
//    public func set(msg: String){
//        self._msg = msg
//    }
    
    //property msg
    public var msg : String {
        set(value){
            _msg = value
        }
        get{
            return _msg
        }
    }
}








