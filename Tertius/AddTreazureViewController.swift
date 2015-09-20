//
//  AddTreazureViewController.swift
//  Tertius
//
//  Created by Ryan Li on 9/20/15.
//  Copyright © 2015 Ryan Li. All rights reserved.
//

import UIKit

class AddTreazureViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var textView: UITextView!
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.text == "Add content here!" {
            textView.text = ""
            textView.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text == "" {
            textView.text = "Add content here!"
            textView.textColor = UIColor.grayColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.becomeFirstResponder()
    }
    
    @IBAction func closePressed(sender: UIButton) {
        textView.endEditing(true)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func donePressed(sender: UIButton) {
        textView.endEditing(true)
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            UserManager.sharedInstance.createNewTreazure([(textView.text, appDelegate.currentLocation!)]) { (success: Bool, error: NSError?) -> Void in
                if let error = error{
                    NSLog("Error : %@", error)
                    return
                }
                else {
                    self.addMessageDoneAlert()
                }
            }
        }
        dismissViewControllerAnimated(true, completion: nil)
    }

    func addMessageDoneAlert() {
        let alert = SCLAlertView(newWindow: ())
        alert.showSuccess("Done!", subTitle: "Your message has been deployed.", closeButtonTitle: "Get it", duration: NSTimeInterval(0.0))
    }
    
}
