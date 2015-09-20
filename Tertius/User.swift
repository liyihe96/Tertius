//
//  User.swift
//  Treazure
//
//  Created by Zizheng Tai on 9/19/15.
//  Copyright © 2015 Treazure. All rights reserved.
//

class User: PFUser {
    
    @NSManaged var currentLocation: PFGeoPoint!
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    func getMessagesInBackgroundWithBlock(block: ([Message]?, NSError?) -> Void) {
        /*
        let query = Treazure.query()!
        query.whereKey("user", equalTo: self)
        query.findObjectsInBackgroundWithBlock { treazures, error in
            if let treazures = treazures {
                var messages = [Message]()
                
                for treazure in treazures {
                    print(treazure)
                    //messages.appendContentsOf(treazure["messages"] as! [Message])
                }
            } else {
                block(nil, error)
            }
        }
        */
    }
}
