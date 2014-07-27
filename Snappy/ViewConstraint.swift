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
    var layoutRelation: NSLayoutRelation?
    var layoutConstant: Float
    
    weak var delegate: ConstraintDelegate?
    
    init(view: View, firstViewAttribute: ViewAttribute)  {
        self.view = view;
        self.firstViewAttribute = firstViewAttribute;
        
        self.layoutPriority = 1000.0// UILayoutPriorityRequired gives error?!
        self.layoutMultiplier = 1.0
        self.layoutConstant = 0.0
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
    
    func addConstraint(attr: NSLayoutAttribute) -> Constraint {
        if (self.layoutRelation) {
            //TODO use assert
            println("Attributes should be chained before defining the constraint relation")
        }
        
        return self.delegate!.constraint(self, addConstraintWithLayoutAttribute:attr)
    }
    
    func equality(relation: NSLayoutRelation, attr: Any) -> Constraint {
        layoutRelation = relation
        
        switch attr {
        case let view as View:
            secondViewAttribute = ViewAttribute(view: firstViewAttribute.view, layoutAttribute: firstViewAttribute.layoutAttribute)
        case let offset as Float:
            layoutConstant = offset
        case let number as NSNumber:
            layoutConstant = number
        case let viewAttribute as ViewAttribute:
            secondViewAttribute = viewAttribute
        case let size as CGSize:
            sizeOffset(size)
        case let point as CGPoint:
            centerOffset(point)
        case let inset as UIEdgeInsets:
            insets(inset)
        default:
            println("unsupported value: \(attr)")
        }
      
//        } else if (strcmp(value.objCType, @encode(CGPoint)) == 0) {
//            CGPoint point;
//            [value getValue:&point];
//            self.centerOffset = point;
//        } else if (strcmp(value.objCType, @encode(CGSize)) == 0) {
//            CGSize size;
//            [value getValue:&size];
//            self.sizeOffset = size;
//        } else if (strcmp(value.objCType, @encode(MASEdgeInsets)) == 0) {
//            MASEdgeInsets insets;
//            [value getValue:&insets];
//            self.insets = insets;
//        } else {
//            NSAssert(NO, @"attempting to set layout constant with unsupported value: %@", value);
//        }
        
        return self;
    }
    
    private func sizeOffset(size: CGSize) {
        switch (firstViewAttribute.layoutAttribute) {
        case .Width:
            layoutConstant = Float(size.width);
            break;
        case .Height:
            layoutConstant = Float(size.height);
            break;
        default:
            break;
        }
    }
    
    private func centerOffset(point: CGPoint) {
        switch (firstViewAttribute.layoutAttribute) {
        case .CenterX:
            layoutConstant = Float(point.x);
            break;
        case .CenterY:
            layoutConstant = Float(point.y);
            break;
        default:
            break;
        }
    }
    
    func insets(insets: UIEdgeInsets) -> Constraint {
        switch (firstViewAttribute.layoutAttribute) {
        case .Left:
            layoutConstant = Float(insets.left);
            break;
        case .Top:
            layoutConstant = Float(insets.top);
            break;
        case .Bottom:
            layoutConstant = Float(-insets.bottom);
            break;
        case .Right:
            layoutConstant = Float(-insets.right);
            break;
        default:
            break;
        }
        return self;
    }
    
    func equalTo(attr: Any) -> Constraint {
        return equality(.Equal, attr: attr)
    }
    
    func greaterThanOrEqualTo(attr: Any) -> Constraint {
        return equality(.GreaterThanOrEqual, attr: attr)
    }
    
    func lessThanOrEqualTo(attr: Any) -> Constraint {
        return equality(.LessThanOrEqual, attr: attr)
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