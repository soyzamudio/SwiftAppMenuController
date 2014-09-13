//
//  BackViewController.swift
//  SwiftAppMenuController
//
//  Created by Jose Zamudio on 7/30/14.
//  Copyright (c) 2014 zamudio. All rights reserved.
//

import Foundation
import UIKit

class BackViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.redColor()
        
        var label = UILabel(frame: self.view.frame)
        label.text = "BACK VIEW"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.boldSystemFontOfSize(20)
        label.textAlignment = .Center
        
        self.view.addSubview(label)
    }
}