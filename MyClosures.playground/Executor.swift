public class Executor {
    public init(){}
    
    private static var count: Int = 0
    
    public var totalTasks: Int {
        return Executor.count
    }
    
    //execution method
    public func execute(task: ()->() ) {
        task() //invoke given task
        Executor.count += 1 // increment count
    }
    
    //calculation function with flexible implementation
    public func calc(n1: Double, n2: Double, oper: (_ n1: Double, _ n2: Double) -> Double) -> Double{
        Executor.count += 1
        return oper(n1, n2)
    }
}










