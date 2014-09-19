//
//  SwiftAppMenuController.swift
//  SwiftAppMenuController
//
//  Created by Jose Zamudio on 7/30/14.
//  Copyright (c) 2014 zamudio. All rights reserved.
//

import Foundation
import UIKit
let kHeaderHeight : CGFloat = 120

var newDelegate = AppDelegate()
var window = UIWindow()
var panGesture = UIPanGestureRecognizer()

class SwiftAppMenuController: UINavigationController {
    
    var firstX = Float()
    var firstY = Float()
    var _origin = CGPoint()
    var _final = CGPoint()
    var duration = CGFloat()
    
    override func viewDidLoad() {
        newDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        window = newDelegate.window!
        window.layer.shadowRadius = 15
        window.layer.shadowOffset = CGSizeMake(0, 0)
        window.layer.shadowColor = UIColor.blackColor().CGColor
        window.layer.shadowOpacity = 0.8
        
        duration = 0.3
    }
    
    func activateSwipeToOpenMenu(onlyNavigation: Bool) -> Void {
        panGesture = UIPanGestureRecognizer(target: self, action: "onPan")
        
        if (onlyNavigation == true) {
            self.navigationBar.addGestureRecognizer(panGesture)
        } else {
            window.addGestureRecognizer(panGesture)
        }
    }
    
    func openAndCloseMenu() -> Void {
        var finalOrigin = CGPoint()
        var f = CGRect()
        
        f = window.frame
        
        if (f.origin.y == CGPointZero.y) {
            finalOrigin.y = CGRectGetHeight(UIScreen.mainScreen().bounds) - kHeaderHeight
        } else {
            finalOrigin.y = CGPointZero.y
        }
        
        finalOrigin.x = 0
        f.origin = finalOrigin
        UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseOut, animations: {
            window.transform = CGAffineTransformIdentity
            window.frame = f
            },
            completion: nil)
    }
    
    func setAnimationDuration(d:CGFloat) -> Void {
        duration = d
    }
    
    func onPan(pan:UIPanGestureRecognizer) -> Void {
        var translation:CGPoint = pan.translationInView(window)
        var velocity:CGPoint = pan.velocityInView(window)
        
        switch (pan.state) {
        case .Began:
            _origin = window.frame.origin
            break
            
        case .Changed:
            if (_origin.y + translation.y >= 0) {
                if (window.frame.origin.y != CGPointZero.y) {
                    window.transform = CGAffineTransformMakeTranslation(0, translation.y)
                } else {
                    window.transform = CGAffineTransformMakeTranslation(0, translation.y)
                }
            }
            break
            
        case .Ended:
            break
            
        case .Cancelled:
            var finalOrigin = CGPointZero
            if (velocity.y >= 0) {
                finalOrigin.y = CGRectGetHeight(UIScreen.mainScreen().bounds) - kHeaderHeight
            }
            
            var f = window.frame
            f.origin = finalOrigin
            UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseOut, animations: {
                window.transform = CGAffineTransformIdentity
                window.frame = f
                }, completion: nil)
            break
            
        default:
            break
        }
    }
    
}