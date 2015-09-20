//
//  TreazurePlace.swift
//  Tertius
//
//  Created by Ryan Li on 9/20/15.
//  Copyright © 2015 Ryan Li. All rights reserved.
//

import Foundation

enum PlaceType{
    case PicketUpFrom
    case LeftAt
}

class TreazurePlace {
    // FIXME
//    var name: String
//    var address: String
    var coordinate: CLLocationCoordinate2D
    var placeType: PlaceType

    init(name: String?, address: String?, coordinate: CLLocationCoordinate2D, placeType: PlaceType) {
//        self.name = name
//        self.address = address
        self.coordinate = coordinate
        self.placeType = placeType
    }
}
