//
//  FrontViewController.swift
//  SwiftAppMenuController
//
//  Created by Jose Zamudio on 7/30/14.
//  Copyright (c) 2014 zamudio. All rights reserved.
//

import Foundation
import UIKit

class FrontViewController: UIViewController {
    
    var navController = SwiftAppMenuController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blueColor()
        self.navigationController.navigationBar.translucent = false
        self.title = "SwiftAppMenuController"

        var rightItem: UIBarButtonItem = UIBarButtonItem()
        rightItem = UIBarButtonItem(title: "Menu", style: .Plain, target: self, action: "menuPressed")
        self.navigationItem.rightBarButtonItem = rightItem
        
        var label = UILabel(frame: self.view.frame)
        label.text = "FRONT VIEW"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.boldSystemFontOfSize(20)
        label.textAlignment = .Center
        
        self.view.addSubview(label)
        
        navController = self.navigationController as SwiftAppMenuController
        navController.setNavigationBarHidden(false, animated: false)
    }
    
    func menuPressed() -> Void {
        navController.openAndCloseMenu()
    }
}