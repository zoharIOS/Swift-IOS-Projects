public class Human: Animal, Vegen, Hunter {
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
    
    public func eat(_ a:Animal){
        if isAlive && !_isFull {
            print("\(name) is eating \(a.name)")
            a.die()
            _isFull = true
        }
    }
    
    public var isFull: Bool {
        return _isFull && isAlive
    }
}
