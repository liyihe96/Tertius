//
//  PlaceMarker.swift
//  Tertius
//
//  Created by Ryan Li on 9/20/15.
//  Copyright © 2015 Ryan Li. All rights reserved.
//

import Foundation

enum PlaceType{
    case PickedUpFrom
    case LeftAt
}

class PlaceMarker: GMSMarker {
    let message: Message
    var address: String = ""
    init(message: Message, placeType: PlaceType) {
        self.message = message
        super.init()
        position = CLLocationCoordinate2D(latitude: message.location.latitude, longitude: message.location.longitude)
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(position) { response, error in
            if let address = response?.firstResult() {
                let lines = address.lines as! [String]
                self.address = lines.joinWithSeparator("\n")
            }
        }
        var color = UIColor.redColor()
        switch placeType {
        case .LeftAt:
            color = UIColor.redColor()
        case .PickedUpFrom:
            color = UIColor.yellowColor()
        }
        icon = UIColor.imageWithColor(color, size: CGSize(width: 10, height: 10))

        layer.masksToBounds = true
        layer.cornerRadius = 5
        groundAnchor = CGPoint(x: 0.5, y: 0.5)
        appearAnimation = kGMSMarkerAnimationPop
    }
}

extension UIColor {
    static func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        let path = UIBezierPath(ovalInRect: rect)
        path.addClip()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}