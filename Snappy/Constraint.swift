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

typealias Delegate = ConstraintDelegate?

@class_protocol protocol Constraint {
    weak var delegate: Delegate { get set }

    var left: Constraint { get }
    var top: Constraint { get }
    var right: Constraint { get }
    var bottom: Constraint { get }
    var leading: Constraint { get }
    var trailing: Constraint { get }
    var width: Constraint { get }
    var height: Constraint { get }
    var centerX: Constraint { get }
    var centerY: Constraint { get }
    var baseline: Constraint { get }
    
    var and: Constraint { get }
    var with: Constraint { get }
    
    func addConstraint(NSLayoutAttribute) -> Constraint
    
    func equalTo(attr: Any) -> Constraint
    
    func greaterThanOrEqualTo(attr: Any) -> Constraint
    
    func lessThanOrEqualTo(attr: Any) -> Constraint
    
    func insets(insets: Any) -> Constraint
    
    func offset(offset: Any) -> Constraint
    
    func multipliedBy(multiplier: Float) -> Constraint
    
    func dividedBy(divider: Float) -> Constraint
    
    func priority(priority: UILayoutPriority) -> Constraint
    
    func priorityLow() -> Constraint
    
    func priorityMedium() -> Constraint
    
    func priorityHigh() -> Constraint
    
    func install()
}
