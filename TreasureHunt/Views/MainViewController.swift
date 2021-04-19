//
//  ViewController.swift
//  TreasureHunt
//
//  Created by Esther Kim on 2021-03-10.
//

import UIKit
import SwiftUI
import MapKit
import Firebase

class MainViewController: UIViewController, CLLocationManagerDelegate{
    let geocoder = CLGeocoder()

    var locationManager: CLLocationManager!
    var mapView: MKMapView!
    
    @IBOutlet var menuBtns: [UIButton]!
    
    @IBAction func flagTogglebtn(_ sender: Any) {
        // when enabled, shows all flags
        // disabled hides flags
    }
    
    @IBAction func handle(_ sender: UIButton) {
        menuBtns.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        /*
        let ref = Database.database().reference()
                let flagsRef = ref.child("flags")
        flagsRef.observeSingleEvent(of: .value, with: { (snapshot) in
                    for snap in snapshot.children {
                        let postSnap = snap as! DataSnapshot
                        if let dict = postSnap.value as? [String:AnyObject] {
                            let name = dict["name"] as! String
                            let address = dict["address"] as! String
                            let task = dict["task"] as! String
                            let tags = dict["tags"] as! String
                            let rating = dict["rating"] as! Double
                            let coordinate = CLLocationCoordinate2D(latitude: dict["lat"] as! Double, longitude: dict["long"] as! Double)
                            let flag = Flag(name: name, address: address, task: task, tags: tags, description: description, rating: rating)
                            self.mapView.addAnnotation(flag)
                        }
                    }
                })
 */
    }}
