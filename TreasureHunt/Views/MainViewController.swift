//
//  ViewController.swift
//  TreasureHunt
//
//  Created by Esther Kim on 2021-03-10.
//

import UIKit
import SwiftUI
import MapKit

class MainViewController: UIViewController, CLLocationManagerDelegate{
    
    var locationManager: CLLocationManager!
    
    @IBOutlet var menuBtns: [UIButton]!
    
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
    }
    
}
