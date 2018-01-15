//Enumeration - value type with predefined values
//Example1
enum Direction {
    case North
    case South
    case East
    case West
}

var d : Direction //variable of type direction
d = Direction.North //set value to north
d = Direction.East //now set to east
d = .West //now set to west with shortcut

if d == Direction.West {
    print("Wild wild west")
}

if d == .West {
    print("The best of the west")
}

//standard useage
switch d {
    case .North:
        print("Winter has come")
    case .South:
        print("Crazy Dornish women")
    case .West:
        print("Westerous..")
    case .East:
        print("Valar moghulis")
}

//Example 2
enum Element {
    case Fire, Water, Earth, Air
}

var e = Element.Water
print(e)
print("\(e) hasValue: \(e.hashValue)")

//Example 3
enum Bulb {
    case A, B, C, D
    
    //var age: Int
    var Watt: Int { //property
        return self.hashValue * 50 + 10
    }
}

var c = Bulb.C
print("\(c) bulb works with \(c.Watt) watt")


//Example 4
enum iStuff {
    case iPod, iPad, iPhone, iCloud
    
    //instance methods
    func makeNoise(){
        switch self {
            case .iPad, .iPod, .iPhone:
                print("Bip bip bip..")
            case .iCloud:
                print("cloud don't make sounds")
        }
    }
}

var ipod = iStuff.iPod //var to enum instance
ipod.makeNoise() //method calling on variable

iStuff.iCloud.makeNoise() //method calling on instance from enum



//Example 5 - Inheritance - CustomStringConvertible (Printable)
enum Permission: CustomStringConvertible {
    case Guest, User, Moderator, Admin
    
    var description: String { //equivalent .toString()
        //return "\(self).."
        return ["Guest", "User", "Moderator", "Admin"][hashValue]
    }
}

var p = Permission.Moderator
print(p)
