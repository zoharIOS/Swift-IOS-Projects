public protocol Hunter {
    func eat(_ a: Animal)
    
    var isFull: Bool { get }
}

public protocol Vegen {
    func eat(_ p: inout Plant?)
    
    var isFull: Bool { get }
}
