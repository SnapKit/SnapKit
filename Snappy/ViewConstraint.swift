//
//  ViewConstraint.swift
//  Snappy
//
//  Created by Jonas Budelmann on 25/07/14.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

import UIKit

class ViewConstraint: Constraint {
    weak var view: View?
    var firstViewAttribute: ViewAttribute
    var layoutPriority: UILayoutPriority
    var layoutMultiplier = 1.0
    
    init(view: View, firstViewAttribute: ViewAttribute)  {
        self.view = view;
        self.firstViewAttribute = firstViewAttribute;
        self.layoutPriority = 750 //UILayoutPriorityRequired gives build error!?
        super.init()
    }
}