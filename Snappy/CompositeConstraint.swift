//
//  CompositeConstraint.swift
//  Snappy
//
//  Created by Jonas Budelmann on 25/07/14.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

import UIKit

class CompositeConstraint: Constraint, ConstraintDelegate {
    var children = [Constraint]()
    weak var delegate: ConstraintDelegate?
    
    init(children: [Constraint]) {
        self.children = children
        for constraint in children {
            constraint.delegate = self
        }
    }
    
    func constraint(constraint: Constraint, shouldBeReplacedWithConstraint replacementConstraint: Constraint) {
        var index: Int?
        for (i, c) in enumerate(self.children) {
            if (c === constraint) {
                index = i
            }
        }
        
        if (index) {
            self.children[index!] = replacementConstraint
        }
    }
    
    func constraint(constraint: Constraint?, addConstraintWithLayoutAttribute layoutAttribute: NSLayoutAttribute) -> Constraint {
        var newConstraint = self.delegate!.constraint(self, addConstraintWithLayoutAttribute: layoutAttribute)
        newConstraint.delegate = self
        self.children.append(newConstraint)
        return newConstraint
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