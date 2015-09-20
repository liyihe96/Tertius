//
//  AppDelegate.swift
//  Tertius
//
//  Created by Ryan Li on 9/19/15.
//  Copyright © 2015 Ryan Li. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let mainSceneIdentifier = "MainScene"
    let loginSceneIdentifier = "LoginScene"
    let PARSE_APPLICATION_ID = "YSspB22NSOECDDG8uzk3wKh63F1HGbgtfH24mVM0"
    let PARSE_CLIENT_KEY = "kQ6uECV065qQS1N2F4kyLIJfTHbQQGn8GzOy1ZS4"
    let googleMapsAPIKey = "AIzaSyAikSfMwcAw224bQBObH73wZ-a9nXnbZD0"

    var window: UIWindow?
    var currentLocation: CLLocation?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        GMSServices.provideAPIKey(googleMapsAPIKey)
        Parse.setApplicationId(PARSE_APPLICATION_ID, clientKey: PARSE_CLIENT_KEY)
        switchRootViewController()

        /*
        for i in 0..<2 {
        let newTreazure = Treazure()
        newTreazure.user = User.currentUser()!
        newTreazure.messages = [Message]()

        for j in 0..<3 {
        let newMessage = Message()
        newMessage.user = User.currentUser()!
        newMessage.location = PFGeoPoint(latitude: Double(i), longitude: Double(j))
        newMessage.text = "Hello, world"

        newTreazure.messages.append(newMessage)
        }

        try! newTreazure.save()
        }
        print("SUCCESS")

        UserManager.sharedInstance.getMessagesOwnedByCurrentUser { messages, error in
        print(messages)
        }
        UserManager.sharedInstance.getMessagesFoundByCurrentUser { messages, error in
        print(messages)
        }
        */
        
        return true
    }

    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        print("application:didRegisterForRemoteNotificationsWithDeviceToken:")

        let installation = PFInstallation.currentInstallation()
        installation.setDeviceTokenFromData(deviceToken)
        if let user = User.currentUser() {
            installation["user"] = user
        }
        installation.saveInBackground()
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        NSLog("Notification: %@", userInfo)

    }

    // MARK: - Helper Methods
    func switchRootViewController() {
        if let _ = PFUser.currentUser() {
            self.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(mainSceneIdentifier)
        } else {
            self.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(loginSceneIdentifier)
        }
    }

    func registerNotification() {

        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
    }

}

