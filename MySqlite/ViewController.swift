import UIKit

class ViewController: UIViewController {

    let fileMgr = FileManager.default
    var docs, dbPath: String!
    var db: FMDatabase!
    
    override func viewDidLoad() {
        //directory path to documents folder
        docs = fileMgr.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        dbPath = docs + "/my.db"
        db = FMDatabase(path: dbPath) //create DB object
        print(docs)
        
        if db.open() { //connection seccussful
            c() //Creation example
            r() //Reading example
            u() //Updateing example
            d() //Delete Example
            print("done")
            db.close()
        }
        
    }
    
    func c(){
        //create table
        exec("CREATE TABLE IF NOT EXISTS stuff (id INTEGER PRIMARY KEY, name VARCHAR(20))")
        
        //create data in table
        exec("INSERT INTO stuff (name) VALUES ('Phone'), ('Marker'), ('Laptop')")
    }
    
    func r(){
        let results = db.executeQuery("SELECT * FROM stuff", withArgumentsIn: nil)!
        while results.next() {
            print(results.string(forColumn: "id"))
            print(results.string(forColumn: "name"))
        }
    }
    
    func u() {
        //change table
        exec("ALTER TABLE stuff ADD COLUMN price DOUBLE DEFAULT 0.0")
        
        //update data
        exec("UPDATE stuff SET price=5.5")
    }
    
    func d(){
        //delete data
        exec("DELETE FROM stuff")
        
        //delete Table itself
        exec("DROP TABLE IF EXISTS stuff")
    }

    //own reuse
    func exec(_ sql: String){
        db.executeStatements(sql)
    }
}

