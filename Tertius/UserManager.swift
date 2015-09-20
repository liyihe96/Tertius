//
//  UserManager.swift
//  Tertius
//
//  Created by Zizheng Tai on 9/20/15.
//  Copyright © 2015 Ryan Li. All rights reserved.
//

class UserManager {
    
    static let sharedInstance = UserManager()
    
    func getMessagesOwnedByCurrentUser(block: ([Message]?, NSError?) -> Void) {
        let query = Message.query()!
        query.whereKey("user", equalTo: User.currentUser()!)
        
        query.findObjectsInBackgroundWithBlock { messages, error in
            if let messages = messages as? [Message] {
                block(messages, nil)
            } else {
                block(nil, error)
            }
        }
    }
    
    func getMessagesFoundByCurrentUser(block: ([Message]?, NSError?) -> Void) {
        let query = Treazure.query()!
        query.whereKey("finder", equalTo: User.currentUser()!)
        
        query.findObjectsInBackgroundWithBlock { treazures, error in
            if let treazures = treazures {
                let query = Message.query()!
                query.whereKey("treazure", containedIn: treazures)
                
                query.findObjectsInBackgroundWithBlock { messages, error in
                    if let messages = messages as? [Message] {
                        block(messages, nil)
                    }
                }
            } else {
                block(nil, error)
            }
        }
    }
    
    func createNewTreazure(messages: [(String?, CLLocation)], block: (Bool, NSError?) -> Void) {
        if messages.isEmpty {
            block(false, nil)
        } else if let user = User.currentUser() {
            var newMessages = [Message]()
            
            for (text, location) in messages {
                let newMessage = Message()
                newMessage.user = user
                newMessage.text = text
                newMessage.location = PFGeoPoint(location: location)
                
                newMessages.append(newMessage)
            }
            
            let newTreazure = Treazure()
            newTreazure.user = user
            newTreazure.messages = newMessages
            
            newTreazure.saveInBackgroundWithBlock(block)
        } else {
            block(false, nil)
        }
    }
}
