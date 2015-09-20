//
//  TreazureDisplayViewController.swift
//  Tertius
//
//  Created by mac on 9/20/15.
//  Copyright © 2015 Ryan Li. All rights reserved.
//

import Foundation
import UIKit

class TreazureDisplayViewController: UIViewController {
    
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var textField: UITextView!
    @IBOutlet var bottomLayout: NSLayoutConstraint!
    @IBAction func receiveMessage(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        doneButton.layer.cornerRadius = 5
    }
}