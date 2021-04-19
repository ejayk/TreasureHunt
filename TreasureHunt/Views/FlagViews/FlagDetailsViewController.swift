//
//  FlagDetailsViewController.swift
//  TreasureHunt
//
//  Created by Ben Jenkyn on 2021-04-11.
//

import UIKit
import Cosmos
import CoreLocation
import MapKit


class FlagDetailsViewController: UIViewController {
    let geocoder = CLGeocoder()
    var lat = 0.0
    var long = 0.0
    
    isUpdate = false
    
    public var flag = Flag.init(name: "",
                                address: "",
                                task: "",
                                tags: "",
                                description: "",
                                rating: 0.0)
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var taskTxtView: UITextView!
    @IBOutlet weak var tagsLbl: UILabel!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var ratingView: CosmosView!
    
    @IBAction func showLocation(_ sender: Any) {
        let coordinate = CLLocationCoordinate2DMake(self.lat, self.long)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
        mapItem.name = flag.name
        mapItem.openInMaps()
    }
    @IBAction func getDirections(_ sender: Any) {
        let coordinate = CLLocationCoordinate2DMake(self.lat, self.long)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
        mapItem.name = flag.name
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = flag.name
        addressLbl.text = flag.address
        taskTxtView.text = flag.task
        tagsLbl.text = flag.tags
        descriptionTxtView.text = flag.description
        ratingView.rating = flag.rating
        
        geocoder.geocodeAddressString(flag.address, completionHandler: {(placemarks, error) -> Void in
           if((error) != nil){
            print("Error", error ?? "")
           }
           if let placemark = placemarks?.first {
              let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
            self.lat = coordinates.latitude
            self.long = coordinates.longitude
           }
        })
        
    }
    
    @IBAction func updateBtn(_ sender: UIButton) {
        if !isUpdate{
            
        }
    }
    
}
