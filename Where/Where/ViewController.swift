//
//  ViewController.swift
//  Where
//
//  Created by toaster on 2021/07/04.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLocationManager()
    }
    
    func setupLocationManager() {
        locationManager = CLLocationManager()
        guard locationManager != nil else {return}
        
        locationManager.requestWhenInUseAuthorization()
    }


}

