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
import FirebaseDatabase


class FlagDetailsViewController: UIViewController {
    let geocoder = CLGeocoder()
    var lat = 0.0
    var long = 0.0
    
    let ref = Database.database().reference()
    
    var didUpdate = false
    
    public var flag = Flag.init(uid: "",
                                name: "",
                                address: "",
                                task: "",
                                tags: "",
                                description: "",
                                rating: 0.0)
    
    var name = ""
    var address = ""
    var task = ""
    var tags = ""
    var descriptionBox = ""
    var rating = 0.0
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var taskTxtView: UITextView!
    @IBOutlet weak var tagsLbl: UILabel!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var ratingView: CosmosView!
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var addressTxt: UILabel!
    @IBOutlet weak var tagsTxt: UILabel!
    
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
        
        name = flag.name
        address = flag.address
        task = flag.task
        tags = flag.tags
        descriptionBox = flag.description
        rating = flag.rating
        
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
        if !didUpdate{
            nameTxt.isHidden = false
            nameTxt.text = name
            nameLbl.isHidden = true
            
            addressTxt.isHidden = false
            addressTxt.text = address
            addressLbl.isHidden = true
            
            taskTxtView.isEditable = true
            
            tagsTxt.isHidden = false
            tagsTxt.text = tags
            tagsLbl.isHidden = true
            
            descriptionTxtView.isEditable = true
            ratingView.settings.updateOnTouch = true
            
            didUpdate = true
            
        }else{
            nameTxt.isHidden = true
            name = nameTxt.text!
            nameLbl.isHidden = false
            nameLbl.text = name
            
            addressTxt.isHidden = true
            address = addressTxt.text!
            addressLbl.isHidden = false
            addressLbl.text = address
            
            task = taskTxtView.text
            taskTxtView.isEditable = false
            
            tagsTxt.isHidden = true
            tags = tagsTxt.text!
            tagsLbl.isHidden = false
            tagsLbl.text = tags
            
            descriptionBox = descriptionTxtView.text
            descriptionTxtView.isEditable = false
            
            rating = ratingView.rating
            ratingView.settings.updateOnTouch = true
            
            let flagUpdate = ["uid": flag.uid,
                              "name": name,
                              "address": address,
                              "task": task,
                              "tags": tags,
                              "description": descriptionBox,
                              "rating": rating
            ] as [String : Any]
            
            let childUpdates = ["/flags/\(flag.uid)": flagUpdate]
            
            ref.updateChildValues(childUpdates)
            
            didUpdate = false
        }
    }
    
}
