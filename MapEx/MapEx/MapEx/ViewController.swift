import UIKit
import MapKit

class ViewController: UIViewController {
    typealias Places = [String :[Double]]
    
    
    var places: Places!
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
       let path = Bundle.main.path(forResource: "places", ofType: "plist")!
        places = NSDictionary(contentsOfFile: path) as! Dictionary
        
        addPins()
    }

    func addPins() {
        let locationMgr = CLLocationManager()
        locationMgr.requestAlwaysAuthorization()
        map.showsUserLocation = true
        map.mapType = .standard
        
        for (name, latLong) in places {
            let pin = MKPointAnnotation()
            pin.title = name
            pin.coordinate = CLLocationCoordinate2D(latitude: latLong[0], longitude: latLong[1])
            map.addAnnotation(pin)
        }
    }
}









