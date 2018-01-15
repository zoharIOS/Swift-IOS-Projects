public class Giraffe: Animal, Vegen {
    private var _isFull: Bool
    
    public override init(name: String){
        _isFull = false
        super.init(name: name)
    }
    
    public func eat(_ p: inout Plant?){
        if isAlive && !_isFull, let food = p {
            print("\(name) is eating \(food.name)")
            p = nil
            _isFull = true
        }
    }
    
    public var isFull: Bool {
        return _isFull && isAlive
    }
}
