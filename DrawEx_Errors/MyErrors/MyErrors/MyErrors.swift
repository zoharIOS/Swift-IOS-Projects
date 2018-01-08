import Foundation

class MyErrors {
    //custom examples
    struct GalError: Error {}
    enum WorkError: Error {
        case isSunday, notEnoughSleep, notEnoughCoffee
    }
    
    //dangerous method
    func doSomeBad() throws {
        //some normal functionality
        print("will be bad")
        //actual danger
        throw GalError()
    }
    
    func notRealyBad() throws {
        print("not realy bad")
    }
    
    func goToWork() throws {
        print("going to work")
        throw WorkError.notEnoughSleep
    }
    
    func badAndClean() throws {
        //equivalent to finally - for cleanups
        defer {
            print("defer - clean up")
        }
        print("doing normal stuff")
        throw GalError()
    }
    
    //maybe throws
    func badOrNot() throws {
        defer {
            print("bad or not - cleanup")
        }
        //some logic
        if arc4random_uniform(10)%2 == 0 {
            //not throwing
        } else {
            throw GalError()
        }
    }
}





















