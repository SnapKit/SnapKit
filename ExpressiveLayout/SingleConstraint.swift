//
//  ViewConstraint.swift
//  ExpressiveLayout
//
//  Created by Jonas Budelmann on 5/06/14.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

import UIKit

class SingleConstraint : Constraint {
    
    var firstViewAttribute: ViewAttribute
    var secondViewAttribute: ViewAttribute?
    var layoutConstant: Double = 0
    
    init(view: UIView, attribute: ViewLayoutAttribute) {
        firstViewAttribute = ViewAttribute(view: view, attribute: attribute)
    }
    
    func add(other: Any) -> Constraint {
        switch other {
        case let offset as Double:
            layoutConstant += offset;
        case let constraint as SingleConstraint:
            println("TODO add to \(constraint)")
        default:
            println("unsupported value: \(other)")
        }
        return self;
    }
    
    func equalTo(other: Any) -> Constraint {
        switch other {
        case let offset as Double:
            layoutConstant = offset;
        case let constraint as SingleConstraint:
            self.secondViewAttribute = constraint.firstViewAttribute;
        default:
            println("unsupported value: \(other)")
        }
        return self;
    }
}
