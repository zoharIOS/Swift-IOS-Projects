# Welcome to IOS projects
----------------------------------
# Cheet sheet
----------------------------------
## summary for the content of this repository:
---------------------------------------------------


[AlertExercise](https://github.com/zoharIOS/HackerU/tree/master/AlertExercise)
### Plist :
```swift
        let path = Bundle.main.path(forResource: "users", ofType: "plist")!
        myUsers = NSDictionary(contentsOfFile: path) as! Dictionary
```   
---
### User defaults
```swift
            private let prefs = UserDefaults.standard
            user = prefs.string(forKey: ViewController.LOG_USER)
            prefs.set(name, forKey: ViewController.LOG_USER)
```
---
### UIALertcontrol
```swift
        let alert = UIAlertController(title: "Login", message: nil, preferredStyle: .alert)
        //text fields
        alert.addTextField(configurationHandler: {(tf) in
        tf.placeholder = "username"
        })

        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "password"
            tf.isSecureTextEntry = true
        })

        func okHandler(action: UIAlertAction) {
        let name = alert.textFields![0].text!
        let pass = alert.textFields![1].text!
        if pass == myUsers[name] { //if password & user are ok
            //legal user -> save in UserDefaults
            prefs.set(name, forKey: ViewController.LOG_USER)
            //set button text & visibility
            profileBtn.setTitle(name, for: .normal)
            profileBtn.isHidden = false
        } else {
            //recursive call - because wrong user
            alertLogin()
        }
    }

      //action buttons
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: okHandler))
      alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

      //show it
      present(alert, animated: true, completion: nil)
```
# more exmples of the same type of alert dialog builder:
[MyAlerts](https://github.com/zoharIOS/HackerU/tree/master/MyAlerts)

---
[MyCustomViews](https://github.com/zoharIOS/HackerU/tree/master/MyCustomViews)
### custom Views :
# make a class and then set the button in storyboard with identity inspector to this class
```swift
class MyButton: UIButton {

    override func draw(_ rect: CGRect) {
        layer.backgroundColor = UIColor.magenta.cgColor
        let width = frame.width
        layer.cornerRadius = CGFloat(15)
    }

}

 btn: UIButton!
 btn.layer.borderColor = UIColor.red.cgColor
 section: UIView! 
 section.layer.borderWidth = 2
```
---
[MyDynViews](https://github.com/zoharIOS/HackerU/blob/master/MyDynViews/ViewController.swift)
## dynamic views
# make a view using UIView constructor 
```swift
    //origin & size
    let origin = CGPoint(x: 40, y: 20)
    let size = CGSize(width: 50, height: 50)        
    //CGRect => width * height
    let frame = CGRect(origin: origin, size: size
    let squareView = UIView(frame: frame) 
    // construct directly:
    let ttl = UILabel(frame: CGRect(x: 20, y: 60, width: 150, height: 50))
    ttl.text = "Zohar"
    ttl.textAlignment = .center
    ttl.layer.borderWidth = 1
        
    UILabel(frame: CGRect(x: 20, y: 60, width: 150, height: 50))
 ```
# after creating the desired view and adding properties to the look and feel you should add it to a parent groupView, for exmple to the super view:
```swift
    view.addSubview(squareView)
 ```
# The link aboth shows exmples also for UIButton()
---
# build dynamic labels on below of each other in a loop 
 ```swift
    let movies = ["John wick", "John wick Part 2", "Jurassic park", "Freddy Krueger"]
    var y: CGFloat = 20 //reuse y position, start from status bar
    for m in movies {
        let ttl = UILabel()
        ttl.text = m //assign relevant text
        ttl.sizeToFit() //wrap content
        ttl.frame.origin.x = 10 //x position
        ttl.frame.origin.y = y //last stored y position
        y += ttl.frame.height //increment y position
        view.addSubview(ttl) //show to user
    } 
# iterating all subviews in the super view:
    for v in view.subviews { //iterate on all subviews
       if v is UILabel { //each one that is label
          v.removeFromSuperview() //remove
        }
```
---        
[MyGradi](https://github.com/zoharIOS/HackerU/blob/master/MyGradi/ViewController.swift)
## Gradient
 ```swift
 //in iOS gradient is a sort of layer
    let layer = CAGradientLayer()
    //gradient colors
    layer.colors = [
        UIColor.red.cgColor, //start color
        UIColor.blue.cgColor //end color
    ]

    //resuse CGRect of View
    layer.frame = view.frame
    layer.frame.origin = CGPoint(x: 0, y: 0)

    //add gradient layer to existing list of layers of that view
    view.layer.insertSublayer(layer, at: 0)
```
---    
# centering before adding to the super view
 ```swift
 //directions
    let l = layer //(aboth example)
    l.startPoint = CGPoint(x: 0, y: 0)
    l.endPoint = CGPoint(x: 1, y: 1)

    l.frame.size = view.frame.size
    l.frame.origin.x = 0
    l.frame.origin.y = 0
    //center in view
    let s = view.frame.size
    l.frame.size = CGSize(width: s.width / 2, height: s.height / 2)
    l.frame.origin.x = s.width / 4
    l.frame.origin.y = s.height / 4
```
















