public class Lion: Animal, Hunter {
    private var _isFull: Bool
    
    public override init(name: String){
        _isFull = false
        super.init(name: name)
    }
    
    public func eat(_ prey: Animal) {
        if isAlive && !_isFull {
            print("lion \(name) is hunting \(prey.name)")
            prey.die()
            _isFull = true
        }
    }
    
    public var isFull: Bool {
        return _isFull && isAlive
    }
}
