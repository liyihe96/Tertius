//
//  CustomPresentationController.swift
//  Tertius
//
//  Created by Ryan Li on 9/20/15.
//  Copyright © 2015 Ryan Li. All rights reserved.
//

import UIKit

class OverlayPresentationController: UIPresentationController {

    let dimmingView = UIView()
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        dimmingView.backgroundColor = UIColor(white: 0, alpha: 0.5)
    }

    override func presentationTransitionWillBegin() {
        dimmingView.frame = containerView!.bounds
        dimmingView.alpha = 0.0
        containerView!.insertSubview(dimmingView, atIndex: 0)

        presentedViewController.transitionCoordinator()!.animateAlongsideTransition({
            context in
            self.dimmingView.alpha = 1.0
            }, completion: nil)
    }

    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator()!.animateAlongsideTransition({
            context in
            self.dimmingView.alpha = 0.0
            }, completion: {
                context in
                self.dimmingView.removeFromSuperview()
        })
    }

    override func frameOfPresentedViewInContainerView() -> CGRect {
        return containerView!.bounds.insetBy(dx: 30, dy: 30)
    }

    override func containerViewWillLayoutSubviews() {
        dimmingView.frame = containerView!.bounds
        presentedView()!.frame = frameOfPresentedViewInContainerView()
    }
}
