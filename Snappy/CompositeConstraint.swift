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
    
    init(children: [Constraint]) {
        self.children = children
        super.init()
        for constraint in children {
            constraint.delegate = self
        }
    }
    
    func constraint(constraint: Constraint, shouldBeReplacedWithConstraint replacementConstraint: Constraint) {
        var index = find(self.children, constraint)
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

}