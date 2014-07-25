//
//  View.swift
//  Snappy
//
//  Created by Jonas Budelmann on 25/07/14.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

import Foundation

import UIKit
typealias View = UIView

extension View {
    var mas_left: ViewAttribute { return ViewAttribute(view: self, layoutAttribute: .Left) }
    var mas_top: ViewAttribute { return ViewAttribute(view: self, layoutAttribute: .Top) }
    var mas_right: ViewAttribute { return ViewAttribute(view: self, layoutAttribute: .Right) }
    var mas_bottom: ViewAttribute { return ViewAttribute(view: self, layoutAttribute: .Bottom) }
    var mas_leading: ViewAttribute { return ViewAttribute(view: self, layoutAttribute: .Leading) }
    var mas_trailing: ViewAttribute { return ViewAttribute(view: self, layoutAttribute: .Trailing) }
    var mas_width: ViewAttribute { return ViewAttribute(view: self, layoutAttribute: .Width) }
    var mas_height: ViewAttribute { return ViewAttribute(view: self, layoutAttribute: .Height) }
    var mas_centerX: ViewAttribute { return ViewAttribute(view: self, layoutAttribute: .CenterX) }
    var mas_centerY: ViewAttribute { return ViewAttribute(view: self, layoutAttribute: .CenterY) }
    var mas_baseline: ViewAttribute { return ViewAttribute(view: self, layoutAttribute: .Baseline) }
    
    func mas_makeConstraints(block: (make: ConstraintMaker) -> ()) {
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        let constraintMaker: ConstraintMaker = ConstraintMaker(view: self)
        block(make: constraintMaker)
        constraintMaker.install()
    }
    
    func mas_closestCommonSuperview(view: View) -> View {
        var closestCommonSuperview: View? = nil
        
        var secondViewSuperview: View = view
        while (!closestCommonSuperview && secondViewSuperview != nil) {
            var firstViewSuperview: View = self
            while (!closestCommonSuperview && firstViewSuperview != nil) {
                if (secondViewSuperview == firstViewSuperview) {
                    closestCommonSuperview = secondViewSuperview
                }
                firstViewSuperview = firstViewSuperview.superview
            }
            secondViewSuperview = secondViewSuperview.superview
        }
        return closestCommonSuperview!
    }
}

