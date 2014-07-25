//
//  ConstraintMaker.swift
//  Snappy
//
//  Created by Jonas Budelmann on 25/07/14.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

import UIKit

class ConstraintMaker: ConstraintDelegate {
    var constraints = [Constraint]()
    weak var view: View?
    
    init(view: View) {
        self.view = view
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
    
    //TODO
    var edges: Constraint { return addConstraints(.Top, .Left, .Bottom, .Right) }
    var size: Constraint { return addConstraints(.Width, .Height) }
    var center: Constraint { return addConstraints(.CenterX, .CenterY) }
    
    func install() {
        for constraint in constraints {
            constraint.install()
        }
        self.constraints.removeAll(keepCapacity: true)
    }
    
    func addConstraint(layoutAttribute: NSLayoutAttribute) -> Constraint {
        return constraint(nil, addConstraintWithLayoutAttribute: layoutAttribute)
    }
    
    
    func addConstraints(layoutAttributes: NSLayoutAttribute...) -> Constraint {
        var children = layoutAttributes.map({ (attr: NSLayoutAttribute) -> Constraint in
            var viewAttribute = ViewAttribute(view: self.view, layoutAttribute: attr)
            return ViewConstraint(view: self.view!, firstViewAttribute: viewAttribute)
        })
        
        var constraint = CompositeConstraint(children: children)
        constraint.delegate = self
        self.constraints.append(constraint)
        
        return constraint
    }
    
    func constraint(constraint: Constraint, shouldBeReplacedWithConstraint replacementConstraint: Constraint) {
        var index: Int?
        for (i, c) in enumerate(self.constraints) {
            if (c === constraint) {
                index = i
            }
        }
        
        if (index) {
            self.constraints[index!] = replacementConstraint
        }
    }
    
    func constraint(constraint: Constraint?, addConstraintWithLayoutAttribute layoutAttribute: NSLayoutAttribute) -> Constraint {
        var viewAttribute = ViewAttribute(view: self.view, layoutAttribute: layoutAttribute)
        var newConstraint = ViewConstraint(view: self.view!, firstViewAttribute: viewAttribute)
        
        if let viewConstraint = constraint as? ViewConstraint  {
            //replace with composite constraint
            var children = [viewConstraint, newConstraint]
            var compositeConstraint = CompositeConstraint(children: children)
            compositeConstraint.delegate = self
            self.constraint(viewConstraint, shouldBeReplacedWithConstraint:compositeConstraint);
            return compositeConstraint
        }
        if (!constraint) {
            newConstraint.delegate = self
            self.constraints.append(newConstraint)
        }
        return newConstraint
    }
}