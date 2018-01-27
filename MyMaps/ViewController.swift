import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var myMap: MKMapView!
    var locaionManager: CLLocationManager!
    
    override func viewDidLoad() {
        locaionManager = CLLocationManager() //initialize location manager
        locaionManager.requestAlwaysAuthorization()// prompt user current location
        myMap.delegate = self //assign instance self as delegate property
        
        //show user's current location
        myMap.showsUserLocation = true
        //map layer type
        myMap.mapType = .standard
        
        //add markers
        addMarker()
    }

    //when user's location changed (walking, driving, etc..)
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        //reset region to each location changed
        let newPlace = userLocation.coordinate
        myMap.setRegion(MKCoordinateRegionMakeWithDistance(newPlace, 8000, 8000), animated: true)
    }
    
    @IBAction func changeType(_ seg: UISegmentedControl) {
        let i = seg.selectedSegmentIndex
        myMap.mapType = MKMapType(rawValue: UInt(i))!
    }
    
    func addMarker() {
        let pin = MKPointAnnotation()
        pin.title = "My Pin"
        pin.coordinate = CLLocationCoordinate2D(latitude: 32.0, longitude: 34.9)
        myMap.addAnnotation(pin) //add to map
    }
}















