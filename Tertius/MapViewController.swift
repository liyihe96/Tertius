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
    let overlayTransitionDelegate = OverlayTransitioningDelegate()
    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Treazure"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addTreazure")
        locationManager.delegate = self;
        locationManager.requestAlwaysAuthorization()
        mapView.delegate = self
    }

    // Mark: - Add Treazure
    func addTreazure() {
        performSegueWithIdentifier("PopAddTreazure", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PopAddTreazure" {
            let toViewController = segue.destinationViewController as UIViewController
            toViewController.transitioningDelegate = overlayTransitionDelegate
            toViewController.modalPresentationStyle = .Custom
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UserManager.sharedInstance.getMessagesOwnedByCurrentUser { messages, error in
            if let error = error {
                NSLog("Error %@", error.localizedDescription)
            }
            for message in messages! {
                let marker = PlaceMarker(message: message, placeType: .LeftAt)
                marker.map = self.mapView
            }
        }
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

extension MapViewController: GMSMapViewDelegate {
    func mapView(mapView: GMSMapView!, idleAtCameraPosition position: GMSCameraPosition!) {

    }
}