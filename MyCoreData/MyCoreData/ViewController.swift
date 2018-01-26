
import UIKit
import CoreData

class ViewController: UIViewController {

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    override func viewDidLoad() {
//        insertNewPerson(name: "Shoval", age: 21)
//        insertNewPerson(name: "Bar", age: 22)
//        insertNewPerson(name: "Guidon", age: 23)
        query()
        print("Done")
        
    }

    func insertNewPerson(name: String, age: Int16) {
        
        let person = Person(context: context)// create new person and insert it to CoreData
        //edit
        person.name = name
        person.age = age
        
        try! context.save()
    }
    
    func query(){
        let req: NSFetchRequest<Person> = Person.fetchRequest()
        
        let people = try! context.fetch(req)
        for p in people {
            print("\(p.name!), \(p.age)")
        }
    }
}

















