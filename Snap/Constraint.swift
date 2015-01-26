//
//  Snap
//
//  Copyright (c) 2011-2014 Masonry Team - https://github.com/Masonry
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#if os(iOS)
import UIKit
#else
import AppKit
#endif

/**
 * Constraint is a single item that defines all the properties for a single ConstraintMaker chain
 */
public class Constraint {
    public var left: Constraint { return addConstraint(ConstraintAttributes.Left) }
    public var top: Constraint { return addConstraint(ConstraintAttributes.Top) }
    public var right: Constraint { return addConstraint(ConstraintAttributes.Right) }
    public var bottom: Constraint { return addConstraint(ConstraintAttributes.Bottom) }
    public var leading: Constraint { return addConstraint(ConstraintAttributes.Leading) }
    public var trailing: Constraint { return addConstraint(ConstraintAttributes.Trailing) }
    public var width: Constraint { return addConstraint(ConstraintAttributes.Width) }
    public var height: Constraint { return addConstraint(ConstraintAttributes.Height) }
    public var centerX: Constraint { return addConstraint(ConstraintAttributes.CenterX) }
    public var centerY: Constraint { return addConstraint(ConstraintAttributes.CenterY) }
    public var baseline: Constraint { return addConstraint(ConstraintAttributes.Baseline) }
    
    public var and: Constraint { return self }
    public var with: Constraint { return self }
    
    // MARK: initializer
    
    internal init(fromItem: ConstraintItem) {
        self.fromItem = fromItem
        self.toItem = ConstraintItem(object: nil, attributes: ConstraintAttributes.None)
    }
    
    // MARK: equalTo
    
    public func equalTo(other: ConstraintItem) -> Constraint {
        return constrainTo(other, relation: .Equal)
    }
    public func equalTo(other: View) -> Constraint {
        return constrainTo(other, relation: .Equal)
    }
    #if os(iOS)
    public func equalTo(other: UILayoutSupport) -> Constraint {
        return constrainTo(other, relation: .Equal)
    }
    #endif
    public func equalTo(other: Float) -> Constraint {
        return constrainTo(other, relation: .Equal)
    }
    public func equalTo(other: Double) -> Constraint {
        return constrainTo(Float(other), relation: .Equal)
    }
    public func equalTo(other: CGFloat) -> Constraint {
        return constrainTo(Float(other), relation: .Equal)
    }
    public func equalTo(other: Int) -> Constraint {
        return constrainTo(Float(other), relation: .Equal)
    }
    public func equalTo(other: UInt) -> Constraint {
        return constrainTo(Float(other), relation: .Equal)
    }
    public func equalTo(other: CGSize) -> Constraint {
        return constrainTo(other, relation: .Equal)
    }
    public func equalTo(other: CGPoint) -> Constraint {
        return constrainTo(other, relation: .Equal)
    }
    public func equalTo(other: EdgeInsets) -> Constraint {
        return constrainTo(other, relation: .Equal)
    }
    
    // MARK: lessThanOrEqualTo
    
    public func lessThanOrEqualTo(other: ConstraintItem) -> Constraint {
        return constrainTo(other, relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: View) -> Constraint {
        return constrainTo(other, relation: .LessThanOrEqualTo)
    }
    #if os(iOS)
    public func lessThanOrEqualTo(other: UILayoutSupport) -> Constraint {
        return constrainTo(other, relation: .LessThanOrEqualTo)
    }
    #endif
    public func lessThanOrEqualTo(other: Float) -> Constraint {
        return constrainTo(other, relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: Double) -> Constraint {
        return constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: CGFloat) -> Constraint {
        return constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: Int) -> Constraint {
        return constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: UInt) -> Constraint {
        return constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: CGSize) -> Constraint {
        return constrainTo(other, relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: CGPoint) -> Constraint {
        return constrainTo(other, relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: EdgeInsets) -> Constraint {
        return constrainTo(other, relation: .LessThanOrEqualTo)
    }
    
    // MARK: greaterThanOrEqualTo
    
    public func greaterThanOrEqualTo(other: ConstraintItem) -> Constraint {
        return constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: View) -> Constraint {
        return constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    #if os(iOS)
    public func greaterThanOrEqualTo(other: UILayoutSupport) -> Constraint {
        return constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    #endif
    public func greaterThanOrEqualTo(other: Float) -> Constraint {
        return constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: Double) -> Constraint {
        return constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: CGFloat) -> Constraint {
        return constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: Int) -> Constraint {
        return constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: UInt) -> Constraint {
        return constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: CGSize) -> Constraint {
        return constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: CGPoint) -> Constraint {
        return constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: EdgeInsets) -> Constraint {
        return constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    
    // MARK: multiplier
    
    public func multipliedBy(amount: Float) -> Constraint {
        self.multiplier = amount
        return self
    }
    public func multipliedBy(amount: Double) -> Constraint {
        return self.multipliedBy(Float(amount))
    }
    public func multipliedBy(amount: CGFloat) -> Constraint {
        return self.multipliedBy(Float(amount))
    }
    public func multipliedBy(amount: Int) -> Constraint {
        return self.multipliedBy(Float(amount))
    }
    public func multipliedBy(amount: UInt) -> Constraint {
        return self.multipliedBy(Float(amount))
    }
    
    public func dividedBy(amount: Float) -> Constraint {
        self.multiplier = 1.0 / amount;
        return self
    }
    public func dividedBy(amount: Double) -> Constraint {
        return self.dividedBy(Float(amount))
    }
    public func dividedBy(amount: CGFloat) -> Constraint {
        return self.dividedBy(Float(amount))
    }
    public func dividedBy(amount: Int) -> Constraint {
        return self.dividedBy(Float(amount))
    }
    public func dividedBy(amount: UInt) -> Constraint {
        return self.dividedBy(Float(amount))
    }
    
    // MARK: priority
    
    public func priority(priority: Float) -> Constraint {
        self.priority = priority
        return self
    }
    public func priority(priority: Double) -> Constraint {
        return self.priority(Float(priority))
    }
    public func priority(priority: CGFloat) -> Constraint {
        return self.priority(Float(priority))
    }
    public func priority(priority: UInt) -> Constraint {
        return self.priority(Float(priority))
    }
    public func priority(priority: Int) -> Constraint {
        return self.priority(Float(priority))
    }
    public func priorityRequired() -> Constraint {
        return self.priority(1000.0)
    }
    public func priorityHigh() -> Constraint {
        return self.priority(750.0)
    }
    public func priorityLow() -> Constraint {
        return self.priority(250.0)
    }
    
    // MARK: offset
    
    public func offset(amount: Float) -> Constraint {
        self.offset = amount
        return self
    }
    public func offset(amount: Double) -> Constraint {
        return self.offset(Float(amount))
    }
    public func offset(amount: CGFloat) -> Constraint {
        return self.offset(Float(amount))
    }
    public func offset(amount: Int) -> Constraint {
        return self.offset(Float(amount))
    }
    public func offset(amount: UInt) -> Constraint {
        return self.offset(Float(amount))
    }
    public func offset(amount: CGPoint) -> Constraint {
        self.offset = amount
        return self
    }
    public func offset(amount: CGSize) -> Constraint {
        self.offset = amount
        return self
    }
    public func offset(amount: EdgeInsets) -> Constraint {
        self.offset = amount
        return self
    }
    
    // MARK: insets
    
    public func insets(amount: EdgeInsets) -> Constraint {
        self.offset = amount
        return self
    }
    
    // MARK: install / uninstall
    
    public func install() -> Array<LayoutConstraint> {
        return self.installOnView(updateExisting: false)
    }
    
    public func uninstall() {
        self.uninstallFromView()
    }
    
    // MARK: internal
    
    internal func installOnView(updateExisting: Bool = false) -> Array<LayoutConstraint> {
        if self.installedOnView != nil {
            NSException(name: "Cannot Install Constraint", reason: "Already installed", userInfo: nil).raise()
            return []
        }
        
        var installOnView: View? = nil
        if self.toItem.view != nil {
            installOnView = Constraint.closestCommonSuperviewFromView(self.fromItem.view, toView: self.toItem.view)
            if installOnView == nil {
                NSException(name: "Cannot Install Constraint", reason: "No common superview between views", userInfo: nil).raise()
                return []
            }
        } else {
            installOnView = self.fromItem.view?.superview
            if installOnView == nil {
                if self.fromItem.attributes == ConstraintAttributes.Width || self.fromItem.attributes == ConstraintAttributes.Height {
                    installOnView = self.fromItem.view
                }
                
                if installedOnView == nil {
                    NSException(name: "Cannot Install Constraint", reason: "Missing superview", userInfo: nil).raise()
                    return []
                }
            }
        }
        
        var layoutConstraints: Array<LayoutConstraint> = []
        let layoutFromAttributes = self.fromItem.attributes.layoutAttributes
        let layoutToAttributes = self.toItem.attributes.layoutAttributes
        
        // get layout from
        let layoutFrom: View? = self.fromItem.view
        
        // get layout relation
        let layoutRelation: NSLayoutRelation = (self.relation != nil) ? self.relation!.layoutRelation : .Equal
        
        for layoutFromAttribute in layoutFromAttributes {
            // get layout to attribute
            let layoutToAttribute = (layoutToAttributes.count > 0) ? layoutToAttributes[0] : layoutFromAttribute
            
            // get layout constant
            var layoutConstant: CGFloat = layoutToAttribute.snp_constantForValue(self.constant)
            layoutConstant += layoutToAttribute.snp_offsetForValue(self.offset)
            
            // get layout to
            var layoutTo: View? = self.toItem.view
            if layoutTo == nil && layoutToAttribute != .Width && layoutToAttribute != .Height {
                layoutTo = installOnView
            }
            
            // create layout constraint
            let layoutConstraint = LayoutConstraint(
                item: layoutFrom!,
                attribute: layoutFromAttribute,
                relatedBy: layoutRelation,
                toItem: layoutTo,
                attribute: layoutToAttribute,
                multiplier: CGFloat(self.multiplier),
                constant: layoutConstant)
            
            // set priority
            layoutConstraint.priority = self.priority
            
            // set constraint
            layoutConstraint.constraint = self
            
            layoutConstraints.append(layoutConstraint)
        }
        
        // special logic for updating
        if updateExisting {
            // get existing constraints for this view
            let existingLayoutConstraints = reverse(layoutFrom!.snp_installedLayoutConstraints)
            
            // array that will contain only new layout constraints
            var newLayoutConstraints = Array<LayoutConstraint>()
            
            // begin looping
            for layoutConstraint in layoutConstraints {
                // layout constraint that should be updated
                var updateLayoutConstraint: LayoutConstraint? = nil
                
                // loop through existing and check for match
                for existingLayoutConstraint in existingLayoutConstraints {
                    if existingLayoutConstraint == layoutConstraint {
                        updateLayoutConstraint = existingLayoutConstraint
                        break
                    }
                }
                
                // if we have existing one lets just update the constant
                if updateLayoutConstraint != nil {
                    updateLayoutConstraint!.constant = layoutConstraint.constant
                }
                // otherwise add this layout constraint to new list
                else {
                    newLayoutConstraints.append(layoutConstraint)
                }
            }
            
            // set constraints to only new ones
            layoutConstraints = newLayoutConstraints
        }
        
        // add constraints
        installOnView!.addConstraints(layoutConstraints)
        
        self.installedOnView = installOnView
        self.installedLayoutConstraints = NSHashTable.weakObjectsHashTable()
        for layoutConstraint in layoutConstraints {
            self.installedLayoutConstraints!.addObject(layoutConstraint)
        }
        
        return layoutConstraints
    }
    
    internal func uninstallFromView() {
        if let view = self.installedOnView {
            // remove all installed layout constraints
            var layoutConstraintsToRemove = Array<LayoutConstraint>()
            if let installedLayoutConstraints = self.installedLayoutConstraints?.allObjects as? Array<LayoutConstraint> {
                layoutConstraintsToRemove += installedLayoutConstraints
            }
            
            if layoutConstraintsToRemove.count > 0 {
                view.removeConstraints(layoutConstraintsToRemove)
            }
            
            // clean up the snp_installedLayoutConstraints
            var layoutConstraints = view.snp_installedLayoutConstraints
            var layoutConstraintsToKeep = Array<LayoutConstraint>()
            for layoutConstraint in layoutConstraints {
                if !contains(layoutConstraintsToRemove, layoutConstraint) {
                    layoutConstraintsToKeep.append(layoutConstraint)
                }
            }
            view.snp_installedLayoutConstraints = layoutConstraintsToKeep
        }
        self.installedOnView = nil
        self.installedLayoutConstraints = nil
    }
    
    // MARK: private
    
    private let fromItem: ConstraintItem
    private var toItem: ConstraintItem
    private var relation: ConstraintRelation?
    private var constant: Any?
    private var multiplier: Float = 1.0
    private var priority: Float = 1000.0
    private var offset: Any?
    
    private var installedLayoutConstraints: NSHashTable?
    private weak var installedOnView: View?
    
    private func addConstraint(attributes: ConstraintAttributes) -> Constraint {
        if self.relation == nil {
            self.fromItem.attributes += attributes
        }
        return self
    }
    
    private func constrainTo(other: ConstraintItem, relation: ConstraintRelation) -> Constraint {
        if other.attributes != ConstraintAttributes.None {
            var toLayoutAttributes = other.attributes.layoutAttributes
            if toLayoutAttributes.count > 1 {
                var fromLayoutAttributes = self.fromItem.attributes.layoutAttributes
                if toLayoutAttributes != fromLayoutAttributes {
                    NSException(name: "Invalid Constraint", reason: "Cannot constrain to multiple non identical attributes", userInfo: nil).raise()
                    return self
                }
                other.attributes = ConstraintAttributes.None
            }
        }
        self.toItem = other
        self.relation = relation
        return self
    }
    private func constrainTo(other: View, relation: ConstraintRelation) -> Constraint {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation)
    }
    #if os(iOS)
    private func constrainTo(other: UILayoutSupport, relation: ConstraintRelation) -> Constraint {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation)
    }
    #endif
    private func constrainTo(other: Float, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: Double, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: CGSize, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: CGPoint, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: EdgeInsets, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    
    private class func closestCommonSuperviewFromView(fromView: View?, toView: View?) -> View? {
        var closestCommonSuperview: View?
        var secondViewSuperview: View? = toView
        while closestCommonSuperview == nil && secondViewSuperview != nil {
            var firstViewSuperview = fromView
            while closestCommonSuperview == nil && firstViewSuperview != nil {
                if secondViewSuperview == firstViewSuperview {
                    closestCommonSuperview = secondViewSuperview
                }
                firstViewSuperview = firstViewSuperview?.superview
            }
            secondViewSuperview = secondViewSuperview?.superview
        }
        return closestCommonSuperview
    }
}

private extension NSLayoutAttribute {
    
    private func snp_offsetForValue(value: Any?) -> CGFloat {
        // Float
        if let float = value as? Float {
            return CGFloat(float)
        }
        // Double
        else if let double = value as? Double {
            return CGFloat(double)
        }
        // UInt
        else if let int = value as? Int {
            return CGFloat(int)
        }
        // Int
        else if let uint = value as? UInt {
            return CGFloat(uint)
        }
        // CGFloat
        else if let float = value as? CGFloat {
            return float
        }
        // CGSize
        else if let size = value as? CGSize {
            if self == .Width {
                return size.width
            } else if self == .Height {
                return size.height
            }
        }
        // CGPoint
        else if let point = value as? CGPoint {
            if self == .Left || self == .CenterX {
                return point.x
            } else if self == .Top || self == .CenterY {
                return point.y
            } else if self == .Right {
                return -point.x
            } else if self == .Bottom {
                return -point.y
            }
        }
        // EdgeInsets
        else if let insets = value as? EdgeInsets {
            if self == .Left {
                return insets.left
            } else if self == .Top {
                return insets.top
            } else if self == .Right {
                return -insets.right
            } else if self == .Bottom {
                return -insets.bottom
            }
        }
        
        return CGFloat(0)
    }
    
    private func snp_constantForValue(value: Any?) -> CGFloat {
        // Float
        if let float = value as? Float {
            return CGFloat(float)
        }
        // Double
        else if let double = value as? Double {
            return CGFloat(double)
        }
        // UInt
        else if let int = value as? Int {
            return CGFloat(int)
        }
        // Int
        else if let uint = value as? UInt {
            return CGFloat(uint)
        }
        // CGFloat
        else if let float = value as? CGFloat {
            return float
        }
        // CGSize
        else if let size = value as? CGSize {
            if self == .Width {
                return size.width
            } else if self == .Height {
                return size.height
            }
        }
        // CGPoint
        else if let point = value as? CGPoint {
            if self == .Left || self == .CenterX {
                return point.x
            } else if self == .Top || self == .CenterY {
                return point.y
            } else if self == .Right {
                return point.x
            } else if self == .Bottom {
                return point.y
            }
        }
        // EdgeInsets
        else if let insets = value as? EdgeInsets {
            if self == .Left {
                return insets.left
            } else if self == .Top {
                return insets.top
            } else if self == .Right {
                return -insets.right
            } else if self == .Bottom {
                return -insets.bottom
            }
        }
        
        return CGFloat(0);
    }
}

internal func ==(left: Constraint, right: Constraint) -> Bool {
    return (left.fromItem == right.fromItem &&
            left.toItem == right.toItem &&
            left.relation == right.relation &&
            left.multiplier == right.multiplier &&
            left.priority == right.priority)
}