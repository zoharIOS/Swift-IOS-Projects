import Foundation

public class MyGens{
    public init() { }
    
    //method with generic parameter
    public func printSome <Temp> (_ some: Temp){
        print(some)
    }
    
    //method with generic parameter & return type
    public func singleVal <T> (_ val: T) -> [T] {
        
        return [val]
    }
    
    public func swapVals <G> (v1: inout G, v2: inout G){
        let temp = v1
        v1 = v2
        v2 = temp
    }
}





