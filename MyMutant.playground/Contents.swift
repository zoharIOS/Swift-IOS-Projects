struct Point {
    var x: Int
    var y: Int
    
    mutating func reborn(){
//        self.x = 0
//        self.y = 0
        self = Point(x: 0, y: 0)
    }
}

//Tests
var p1 = Point(x: 3, y: 5)
var p2 = p1
print(p1)
p1.reborn()
print(p1)

print(p2)
