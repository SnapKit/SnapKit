//
//  Constraint.swift
//  Snappy
//
//  Created by Jonas Budelmann on 25/07/14.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

import UIKit

@class_protocol protocol ConstraintDelegate {
    func constraint(constraint: Constraint, shouldBeReplacedWithConstraint replacementConstraint: Constraint)
    func constraint(constraint: Constraint?, addConstraintWithLayoutAttribute layoutAttribute: NSLayoutAttribute) -> Constraint
}

class Constraint: Equatable {
    weak var delegate: ConstraintDelegate?
    
    init() {
        
    }
    
    var left: Constraint { return Constraint() }
    var top: Constraint { return Constraint() }
    var right: Constraint { return Constraint() }
    var bottom: Constraint { return Constraint() }
    var leading: Constraint { return Constraint() }
    var trailing: Constraint { return Constraint() }
    var width: Constraint { return Constraint() }
    var height: Constraint { return Constraint() }
    var centerX: Constraint { return Constraint() }
    var centerY: Constraint { return Constraint() }
    var baseline: Constraint { return Constraint() }
    
    var and: Constraint { return self }
    var with: Constraint { return self }
    
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


@infix func ==(lhs: Constraint, rhs: Constraint) -> Bool {
    return lhs === rhs;
}