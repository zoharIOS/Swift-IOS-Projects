public class Animal {
    var isAlive: Bool
    let name: String
    
    public init(name: String){
        self.isAlive = true
        self.name = name
    }
    
    public func die(){
        isAlive = false
    }
}
