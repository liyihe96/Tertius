//
//  PlaceMarker.swift
//  Tertius
//
//  Created by Ryan Li on 9/20/15.
//  Copyright © 2015 Ryan Li. All rights reserved.
//

import Foundation

class PlaceMarker: GMSMarker {
    let place: GooglePlace

    init(place: GooglePlace) {
        self.place = place
        super.init()

        position = place.coordinate
        icon = UIImage(named: place.placeType+"_pin")
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = kGMSMarkerAnimationPop
    }
}
