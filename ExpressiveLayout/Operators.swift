//
//  Operators.swift
//  ExpressiveLayout
//
//  Created by Jonas Budelmann on 5/06/14.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

import UIKit

//TODO spilt into different files

enum ViewLayoutAttribute {
    case CenterX
    case CenterY
    case Left
    case Right
    case Top
    case Bottom
    case Width
    case Height
}

class ViewAttribute {
    weak var view: UIView?
    let attribute: ViewLayoutAttribute
    
    init(view: UIView, attribute: ViewLayoutAttribute) {
        self.view = view
        self.attribute = attribute
    }
}

@infix func + (left: Constraint, right: Any) -> Constraint {
    return left.add(right);
}

@infix func == (left: Constraint, right: Any) -> Constraint {
    return left.equalTo(right);
}

func installConstraints(constraints: Array<Constraint>) {
    // find common superview
    // create NSLayoutConstraint
}

extension UIView {
    var left: Constraint { return SingleConstraint(view: self, attribute: .Left) }
    var right: Constraint { return SingleConstraint(view: self, attribute: .Right) }
    var top: Constraint { return SingleConstraint(view: self, attribute: .Top) }
    var bottom: Constraint { return SingleConstraint(view: self, attribute: .Bottom) }
}
