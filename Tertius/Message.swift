//
//  Message.swift
//  Treazure
//
//  Created by Zizheng Tai on 9/19/15.
//  Copyright © 2015 Treazure. All rights reserved.
//

class Message: PFObject, PFSubclassing {
    
    @NSManaged var user: User
    @NSManaged var finder: User?
    @NSManaged var audio: PFFile?
    @NSManaged var text: String?
    @NSManaged var location: PFGeoPoint
    
    override class func initialize() {
        struct Static {
            static var onceToken: dispatch_once_t = 0
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Message"
    }
}
