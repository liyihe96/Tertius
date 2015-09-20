//
//  MapViewController.swift
//  Tertius
//
//  Created by Ryan Li on 9/19/15.
//  Copyright © 2015 Ryan Li. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self;
        locationManager.requestAlwaysAuthorization()
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways {
            locationManager.startUpdatingLocation()
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first as CLLocation? {

            // 7
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 20, bearing: 0, viewingAngle: 0)

            // 8
            locationManager.stopUpdatingLocation()
        }

    }
}
