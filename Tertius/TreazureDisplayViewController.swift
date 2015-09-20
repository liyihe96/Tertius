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
        super.viewDidLoad()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        doneButton.layer.cornerRadius = 5
        doneButton.layer.masksToBounds = true
    }


    var treazure: Treazure? {
        didSet {
            if let treazure = treazure {
                self.textField.text = treazure.messages.first!.text!
            }
        }
    }

    var treazureId: String? {
        didSet {
            if let treazureId = treazureId {
                let query = Treazure.query()!
                query.getObjectInBackgroundWithId(treazureId) { object, error in
                    if let error = error {
                        NSLog("Error :%@", error.localizedDescription)
                        return
                    }
                    self.treazure = object as? Treazure
                }
            }
        }
    }
}