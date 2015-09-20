//
//  OverlayTransitionDelegate.swift
//  Tertius
//
//  Created by Ryan Li on 9/20/15.
//  Copyright © 2015 Ryan Li. All rights reserved.
//

import UIKit

class OverlayTransitioningDelegate : NSObject, UIViewControllerTransitioningDelegate {
    func presentationControllerForPresentedViewController(presented: UIViewController,
        presentingViewController presenting: UIViewController,
        sourceViewController source: UIViewController) -> UIPresentationController? {

            return OverlayPresentationController(presentedViewController: presented,
                presentingViewController: presenting)
    }
}
