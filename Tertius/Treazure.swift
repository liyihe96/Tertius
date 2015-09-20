//
//  Treazure.swift
//  Treazure
//
//  Created by Zizheng Tai on 9/19/15.
//  Copyright © 2015 Treazure. All rights reserved.
//

class Treazure: PFObject, PFSubclassing {
    
    @NSManaged var user: PFUser
    @NSManaged var finder: PFUser?
    @NSManaged var messages: [Message]
    @NSManaged var numMessagesFound: Int
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Treazure"
    }
}
