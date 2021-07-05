//
//  ViewController.swift
//  Where
//
//  Created by toaster on 2021/07/04.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        setupLocationManager()
    }
    
//    private func setupLocationManager() {
//        locationManager = CLLocationManager()
//        guard locationManager != nil else {return}
//
//        locationManager.requestWhenInUseAuthorization()
//    }
    
    @IBAction func myLocationButtonDidTapped(_ sender: Any) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

