//Example 1 - Custom class
extension Person {
    public func getName() -> String{
        return self.name
    }
    
    public func setName(_ name: String) {
        self.name = name
    }
}

//Example 2 - Built in type
extension Int {
    public func timesTwo() -> Int {
        return self + self
    }
    
    //with mutating
    public mutating func twice() {
        self += self
    }
}

//Example 3 - inheritance
extension Person: LivingBeing {
    public func breath() {
        
    }
}

//Example 4 - properties
extension Bike {
    //Calculated on the fly
    public var hp: Double {
        return self.cc / 6
    }
}


