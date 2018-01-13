import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        async1()
        async2()
        async3()
        async4()
    }

    //Example 1
    func async1(){
        //what to do asynchronously
        DispatchQueue.global(qos: .background).async(execute: {
            print("do in background")
            //usleep(1000000)
            //when need to sync - UI main thread
            DispatchQueue.main.async {
                print("post execute")
            }
        })
    }
    
    func async2() {
        AsyncTask(backgroundTask: {(p:Int) in
            //doing in background
            if p > 0 {
                print("positive")
            }
        }).execute(1)
    }
    
    func async3() {
        AsyncTask(backgroundTask: { (p: Bool) -> Int in
            if p {
                return 100
            }
            return -50
        }, afterTask: { (res: Int) in
            //UI main thread functionality
            print(res)
        }).execute(false)
    }
    
    //Example 4
    func async4(){
        let task = AsyncTask(beforeTask: {
            //in current thread
        }, backgroundTask: { (plist: String) -> [String: [String]] in
            //In background thread
            let path = Bundle.main.path(forResource: plist, ofType: "plist")!
            return NSDictionary(contentsOfFile: path) as! Dictionary
        }, afterTask: { (dict) in
            //In Main thread
            print(dict)
        })
        task.execute("Data") //parameter to pass to backgroundTask closure
    }
}










