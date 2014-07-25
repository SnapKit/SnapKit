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
    var secondViewAttribute: ViewAttribute?
    
    var layoutPriority = 1000.0// UILayoutPriorityRequired gives error?!
    var layoutMultiplier = 1.0
    var layoutConstraint: NSLayoutConstraint?
    var layoutRelation = NSLayoutRelation.Equal
    var layoutConstant = 0.0
    var hasLayoutRelation = false;
    
    weak var delegate: ConstraintDelegate?
    
    init(view: View, firstViewAttribute: ViewAttribute)  {
        self.view = view;
        self.firstViewAttribute = firstViewAttribute;
    }
    
    var left: Constraint { return addConstraint(.Left) }
    var top: Constraint { return addConstraint(.Top) }
    var right: Constraint { return addConstraint(.Right) }
    var bottom: Constraint { return addConstraint(.Bottom) }
    var leading: Constraint { return addConstraint(.Leading) }
    var trailing: Constraint { return addConstraint(.Trailing) }
    var width: Constraint { return addConstraint(.Width) }
    var height: Constraint { return addConstraint(.Height) }
    var centerX: Constraint { return addConstraint(.CenterX) }
    var centerY: Constraint { return addConstraint(.CenterY) }
    var baseline: Constraint { return addConstraint(.Baseline) }
    
    var and: Constraint { return self }
    var with: Constraint { return self }
    
    func addConstraint(NSLayoutAttribute) -> Constraint {
        return self;
    }
    
    func equalTo(attr: Any) -> Constraint {
        return self
    }
    
    func greaterThanOrEqualTo(attr: Any) -> Constraint {
        return self
    }
    
    func lessThanOrEqualTo(attr: Any) -> Constraint {
        return self
    }
    
    func insets(insets: Any) -> Constraint {
        return self
    }
    
    func offset(offset: Any) -> Constraint {
        return self
    }
    
    func multipliedBy(multiplier: Float) -> Constraint {
        return self
    }
    
    func dividedBy(divider: Float) -> Constraint {
        return self
    }
    
    func priority(priority: UILayoutPriority) -> Constraint {
        return self
    }
    
    func priorityLow() -> Constraint {
        return self
    }
    
    func priorityMedium() -> Constraint {
        return self
    }
    
    func priorityHigh() -> Constraint {
        return self
    }
    
    func install() {
    }
}