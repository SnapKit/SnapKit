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
* Constraint is a protocol that exposes the public methods on a Constraint
*/
public protocol Constraint: class {
    
    func install() -> [LayoutConstraint]
    func uninstall() -> Void
    func activate() -> Void
    func deactivate() -> Void
    
}

public protocol ConstraintFinalizable: class {
    
    var constraint: Constraint { get }
    
}

/**
 * ConstraintPriortizable is a protocol that allows a constraint to be prioritized
 */
public protocol ConstraintPriortizable: ConstraintFinalizable {
    
    func priority(priority: Float) -> ConstraintFinalizable
    func priority(priority: Double) -> ConstraintFinalizable
    func priority(priority: CGFloat) -> ConstraintFinalizable
    func priority(priority: UInt) -> ConstraintFinalizable
    func priority(priority: Int) -> ConstraintFinalizable
    func priorityRequired() -> ConstraintFinalizable
    func priorityHigh() -> ConstraintFinalizable
    func priorityMedium() -> ConstraintFinalizable
    func priorityLow() -> ConstraintFinalizable
}

/**
 * ConstraintMultipliable is a protocol that allows a constraint to be multiplied
 */
public protocol ConstraintMultipliable: ConstraintPriortizable {
    
    func multipliedBy(amount: Float) -> ConstraintPriortizable
    func multipliedBy(amount: Double) -> ConstraintPriortizable
    func multipliedBy(amount: CGFloat) -> ConstraintPriortizable
    func multipliedBy(amount: Int) -> ConstraintPriortizable
    func multipliedBy(amount: UInt) -> ConstraintPriortizable
    
    func dividedBy(amount: Float) -> ConstraintPriortizable
    func dividedBy(amount: Double) -> ConstraintPriortizable
    func dividedBy(amount: CGFloat) -> ConstraintPriortizable
    func dividedBy(amount: Int) -> ConstraintPriortizable
    func dividedBy(amount: UInt) -> ConstraintPriortizable
}

/**
 * ConstraintOffsetable is a protocol that allows a constraint to be offset
 */
public protocol ConstraintOffsetable: ConstraintMultipliable {
    
    func offset(amount: Float) -> ConstraintMultipliable
    func offset(amount: Double) -> ConstraintMultipliable
    func offset(amount: CGFloat) -> ConstraintMultipliable
    func offset(amount: Int) -> ConstraintMultipliable
    func offset(amount: UInt) -> ConstraintMultipliable
    func offset(amount: CGPoint) -> ConstraintMultipliable
    func offset(amount: CGSize) -> ConstraintMultipliable
    func offset(amount: EdgeInsets) -> ConstraintMultipliable
    
    func insets(amount: EdgeInsets) -> ConstraintMultipliable
}



/**
 * ConstraintRelatable is a protocol that allows a constraint to be set related to another item/constant by equalTo, lessThanOrEqualTo or greaterThanOrEqualTo
 */
public protocol ConstraintRelatable: class {
    
    func equalTo(other: ConstraintItem) -> ConstraintOffsetable
    func equalTo(other: View) -> ConstraintOffsetable
    #if os(iOS)
    func equalTo(other: UILayoutSupport) -> ConstraintOffsetable
    #endif
    func equalTo(other: Float) -> ConstraintMultipliable
    func equalTo(other: Double) -> ConstraintMultipliable
    func equalTo(other: CGFloat) -> ConstraintMultipliable
    func equalTo(other: Int) -> ConstraintMultipliable
    func equalTo(other: UInt) -> ConstraintMultipliable
    func equalTo(other: CGSize) -> ConstraintMultipliable
    func equalTo(other: CGPoint) -> ConstraintMultipliable
    func equalTo(other: EdgeInsets) -> ConstraintMultipliable
    
    func lessThanOrEqualTo(other: ConstraintItem) -> ConstraintOffsetable
    func lessThanOrEqualTo(other: View) -> ConstraintOffsetable
    #if os(iOS)
    func lessThanOrEqualTo(other: UILayoutSupport) -> ConstraintOffsetable
    #endif
    func lessThanOrEqualTo(other: Float) -> ConstraintMultipliable
    func lessThanOrEqualTo(other: Double) -> ConstraintMultipliable
    func lessThanOrEqualTo(other: CGFloat) -> ConstraintMultipliable
    func lessThanOrEqualTo(other: Int) -> ConstraintMultipliable
    func lessThanOrEqualTo(other: UInt) -> ConstraintMultipliable
    func lessThanOrEqualTo(other: CGSize) -> ConstraintMultipliable
    func lessThanOrEqualTo(other: CGPoint) -> ConstraintMultipliable
    func lessThanOrEqualTo(other: EdgeInsets) -> ConstraintMultipliable
    
    func greaterThanOrEqualTo(other: ConstraintItem) -> ConstraintOffsetable
    func greaterThanOrEqualTo(other: View) -> ConstraintOffsetable
    #if os(iOS)
    func greaterThanOrEqualTo(other: UILayoutSupport) -> ConstraintOffsetable
    #endif
    func greaterThanOrEqualTo(other: Float) -> ConstraintMultipliable
    func greaterThanOrEqualTo(other: Double) -> ConstraintMultipliable
    func greaterThanOrEqualTo(other: CGFloat) -> ConstraintMultipliable
    func greaterThanOrEqualTo(other: Int) -> ConstraintMultipliable
    func greaterThanOrEqualTo(other: UInt) -> ConstraintMultipliable
    func greaterThanOrEqualTo(other: CGSize) -> ConstraintMultipliable
    func greaterThanOrEqualTo(other: CGPoint) -> ConstraintMultipliable
    func greaterThanOrEqualTo(other: EdgeInsets) -> ConstraintMultipliable

}

/**
* ConstraintExtendable is a protocol that allows a constraint to be extended
*/
public protocol ConstraintExtendable: ConstraintRelatable {
    
    var left: ConstraintExtendable { get }
    var top: ConstraintExtendable { get }
    var bottom: ConstraintExtendable { get }
    var leading: ConstraintExtendable { get }
    var trailing: ConstraintExtendable { get }
    var width: ConstraintExtendable { get }
    var height: ConstraintExtendable { get }
    var centerX: ConstraintExtendable { get }
    var centerY: ConstraintExtendable { get }
    var baseline: ConstraintExtendable { get }
    
    #if os(iOS)
    var firstBaseline: ConstraintExtendable { get }
    var leftMargin: ConstraintExtendable { get }
    var rightMargin: ConstraintExtendable { get }
    var topMargin: ConstraintExtendable { get }
    var bottomMargin: ConstraintExtendable { get }
    var leadingMargin: ConstraintExtendable { get }
    var trailingMargin: ConstraintExtendable { get }
    var centerXWithinMargins: ConstraintExtendable { get }
    var centerYWithinMargins: ConstraintExtendable { get }
    #endif
}

/**
 * MutableConstraint is a single item that defines all the properties for a single ConstraintMaker chain
 */
final internal class MutableConstraint: Constraint, ConstraintExtendable, ConstraintOffsetable, ConstraintFinalizable {
    
    var left: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.Left) }
    var top: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.Top) }
    var right: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.Right) }
    var bottom: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.Bottom) }
    var leading: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.Leading) }
    var trailing: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.Trailing) }
    var width: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.Width) }
    var height: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.Height) }
    var centerX: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.CenterX) }
    var centerY: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.CenterY) }
    var baseline: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.Baseline) }
    
    #if os(iOS)
    var firstBaseline: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.FirstBaseline) }
    var leftMargin: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.LeftMargin) }
    var rightMargin: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.RightMargin) }
    var topMargin: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.TopMargin) }
    var bottomMargin: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.BottomMargin) }
    var leadingMargin: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.LeadingMargin) }
    var trailingMargin: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.TrailingMargin) }
    var centerXWithinMargins: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.CenterXWithinMargins) }
    var centerYWithinMargins: ConstraintExtendable { return self.addConstraint(ConstraintAttributes.CenterYWithinMargins) }
    #endif
    
    // MARK: initializer
    
    init(fromItem: ConstraintItem) {
        self.fromItem = fromItem
        self.toItem = ConstraintItem(object: nil, attributes: ConstraintAttributes.None)
    }
    
    // MARK: equalTo
    
    func equalTo(other: ConstraintItem) -> ConstraintOffsetable {
        return self.constrainTo(other, relation: .Equal)
    }
    func equalTo(other: View) -> ConstraintOffsetable {
        return self.constrainTo(other, relation: .Equal)
    }
    #if os(iOS)
    func equalTo(other: UILayoutSupport) -> ConstraintOffsetable {
        return self.constrainTo(other, relation: .Equal)
    }
    #endif
    func equalTo(other: Float) -> ConstraintMultipliable {
        return self.constrainTo(other, relation: .Equal)
    }
    func equalTo(other: Double) -> ConstraintMultipliable {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    func equalTo(other: CGFloat) -> ConstraintMultipliable {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    func equalTo(other: Int) -> ConstraintMultipliable {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    func equalTo(other: UInt) -> ConstraintMultipliable {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    func equalTo(other: CGSize) -> ConstraintMultipliable {
        return self.constrainTo(other, relation: .Equal)
    }
    func equalTo(other: CGPoint) -> ConstraintMultipliable {
        return self.constrainTo(other, relation: .Equal)
    }
    func equalTo(other: EdgeInsets) -> ConstraintMultipliable {
        return self.constrainTo(other, relation: .Equal)
    }
    
    // MARK: lessThanOrEqualTo
    
    func lessThanOrEqualTo(other: ConstraintItem) -> ConstraintOffsetable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: View) -> ConstraintOffsetable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    #if os(iOS)
    func lessThanOrEqualTo(other: UILayoutSupport) -> ConstraintOffsetable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    #endif
    func lessThanOrEqualTo(other: Float) -> ConstraintMultipliable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: Double) -> ConstraintMultipliable {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: CGFloat) -> ConstraintMultipliable {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: Int) -> ConstraintMultipliable {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: UInt) -> ConstraintMultipliable {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: CGSize) -> ConstraintMultipliable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: CGPoint) -> ConstraintMultipliable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: EdgeInsets) -> ConstraintMultipliable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    
    // MARK: greaterThanOrEqualTo
    
    func greaterThanOrEqualTo(other: ConstraintItem) -> ConstraintOffsetable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: View) -> ConstraintOffsetable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    #if os(iOS)
    func greaterThanOrEqualTo(other: UILayoutSupport) -> ConstraintOffsetable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    #endif
    func greaterThanOrEqualTo(other: Float) -> ConstraintMultipliable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: Double) -> ConstraintMultipliable {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: CGFloat) -> ConstraintMultipliable {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: Int) -> ConstraintMultipliable {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: UInt) -> ConstraintMultipliable {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: CGSize) -> ConstraintMultipliable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: CGPoint) -> ConstraintMultipliable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: EdgeInsets) -> ConstraintMultipliable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    
    // MARK: multiplier
    
    func multipliedBy(amount: Float) -> ConstraintPriortizable {
        self.multiplier = amount
        return self
    }
    func multipliedBy(amount: Double) -> ConstraintPriortizable {
        return self.multipliedBy(Float(amount))
    }
    func multipliedBy(amount: CGFloat) -> ConstraintPriortizable {
        return self.multipliedBy(Float(amount))
    }
    func multipliedBy(amount: Int) -> ConstraintPriortizable {
        return self.multipliedBy(Float(amount))
    }
    func multipliedBy(amount: UInt) -> ConstraintPriortizable {
        return self.multipliedBy(Float(amount))
    }
    
    func dividedBy(amount: Float) -> ConstraintPriortizable {
        self.multiplier = 1.0 / amount;
        return self
    }
    func dividedBy(amount: Double) -> ConstraintPriortizable {
        return self.dividedBy(Float(amount))
    }
    func dividedBy(amount: CGFloat) -> ConstraintPriortizable {
        return self.dividedBy(Float(amount))
    }
    func dividedBy(amount: Int) -> ConstraintPriortizable {
        return self.dividedBy(Float(amount))
    }
    func dividedBy(amount: UInt) -> ConstraintPriortizable {
        return self.dividedBy(Float(amount))
    }
    
    // MARK: priority
    
    func priority(priority: Float) -> ConstraintFinalizable {
        self.priority = priority
        return self
    }
    func priority(priority: Double) -> ConstraintFinalizable {
        return self.priority(Float(priority))
    }
    func priority(priority: CGFloat) -> ConstraintFinalizable {
        return self.priority(Float(priority))
    }
    func priority(priority: UInt) -> ConstraintFinalizable {
        return self.priority(Float(priority))
    }
    func priority(priority: Int) -> ConstraintFinalizable {
        return self.priority(Float(priority))
    }
    func priorityRequired() -> ConstraintFinalizable {
        return self.priority(1000.0)
    }
    func priorityHigh() -> ConstraintFinalizable {
        return self.priority(750.0)
    }
    func priorityMedium() -> ConstraintFinalizable {
        #if os(iOS)
        return self.priority(500.0)
        #else
        return self.priority(501.0)
        #endif
    }
    func priorityLow() -> ConstraintFinalizable {
        return self.priority(250.0)
    }
    
    // MARK: offset
    
    func offset(amount: Float) -> ConstraintMultipliable {
        self.offset = amount
        return self
    }
    func offset(amount: Double) -> ConstraintMultipliable {
        return self.offset(Float(amount))
    }
    func offset(amount: CGFloat) -> ConstraintMultipliable {
        return self.offset(Float(amount))
    }
    func offset(amount: Int) -> ConstraintMultipliable {
        return self.offset(Float(amount))
    }
    func offset(amount: UInt) -> ConstraintMultipliable {
        return self.offset(Float(amount))
    }
    func offset(amount: CGPoint) -> ConstraintMultipliable {
        self.offset = amount
        return self
    }
    func offset(amount: CGSize) -> ConstraintMultipliable {
        self.offset = amount
        return self
    }
    func offset(amount: EdgeInsets) -> ConstraintMultipliable {
        self.offset = amount
        return self
    }
    
    // MARK: insets
    
    func insets(amount: EdgeInsets) -> ConstraintMultipliable {
        self.offset = amount
        return self
    }
    
    // MARK: Constraint
    
    var constraint: Constraint {
        return self
    }
    
    // MARK: install / uninstall
    
    func install() -> [LayoutConstraint] {
        return self.installOnView(updateExisting: false)
    }
    
    func uninstall() {
        self.uninstallFromView()
    }
    
    func activate() {
        if NSLayoutConstraint.respondsToSelector("activateConstraints:") && self.installInfo != nil {
            let layoutConstraints = self.installInfo!.layoutConstraints.allObjects as! [LayoutConstraint]
            if layoutConstraints.count > 0 {
                NSLayoutConstraint.activateConstraints(layoutConstraints)
            }
        } else {
            self.install()
        }
    }
    
    func deactivate() {
        if NSLayoutConstraint.respondsToSelector("deactivateConstraints:") && self.installInfo != nil {
            let layoutConstraints = self.installInfo!.layoutConstraints.allObjects as! [LayoutConstraint]
            if layoutConstraints.count > 0 {
                NSLayoutConstraint.deactivateConstraints(layoutConstraints)
            }
        } else {
            self.uninstall()
        }
    }
    
    func installOnView(updateExisting: Bool = false) -> [LayoutConstraint] {
        var installOnView: View? = nil
        if self.toItem.view != nil {
            installOnView = MutableConstraint.closestCommonSuperviewFromView(self.fromItem.view, toView: self.toItem.view)
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
                
                if installOnView == nil {
                    NSException(name: "Cannot Install Constraint", reason: "Missing superview", userInfo: nil).raise()
                    return []
                }
            }
        }
        
        if let installedOnView = self.installInfo?.view {
            if installedOnView != installOnView {
                NSException(name: "Cannot Install Constraint", reason: "Already installed on different view.", userInfo: nil).raise()
                return []
            }
            return self.installInfo?.layoutConstraints.allObjects as? [LayoutConstraint] ?? []
        }
        
        var newLayoutConstraints = [LayoutConstraint]()
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
            layoutConstraint.snp_constraint = self
            
            newLayoutConstraints.append(layoutConstraint)
        }
        
        // special logic for updating
        if updateExisting {
            // get existing constraints for this view
            let existingLayoutConstraints = reverse(layoutFrom!.snp_installedLayoutConstraints)
            
            // array that will contain only new layout constraints to keep
            var newLayoutConstraintsToKeep = [LayoutConstraint]()

            // begin looping
            for layoutConstraint in newLayoutConstraints {
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
                // otherwise add this layout constraint to new keep list
                else {
                    newLayoutConstraintsToKeep.append(layoutConstraint)
                }
            }

            // set constraints to only new ones
            newLayoutConstraints = newLayoutConstraintsToKeep
        }
        
        // add constraints
        installOnView!.addConstraints(newLayoutConstraints)
        
        // set install info
        self.installInfo = ConstraintInstallInfo(view: installOnView, layoutConstraints: NSHashTable.weakObjectsHashTable())
        
        // store which layout constraints are installed for this constraint
        for layoutConstraint in newLayoutConstraints {
            self.installInfo!.layoutConstraints.addObject(layoutConstraint)
        }
        
        // store the layout constraints against the layout from view
        layoutFrom!.snp_installedLayoutConstraints += newLayoutConstraints
        
        // return the new constraints
        return newLayoutConstraints
    }
    
    func uninstallFromView() {
        if let installInfo = self.installInfo,
           let installedLayoutConstraints = installInfo.layoutConstraints.allObjects as? [LayoutConstraint] {
            
            if installedLayoutConstraints.count > 0 {
                
                if let installedOnView = installInfo.view {
                    // remove the constraints from the UIView's storage
                    installedOnView.removeConstraints(installedLayoutConstraints)
                }
                
                // remove the constraints from the from item view
                if let fromView = self.fromItem.view {
                    fromView.snp_installedLayoutConstraints = fromView.snp_installedLayoutConstraints.filter {
                        return !contains(installedLayoutConstraints, $0)
                    }
                }
            }
            
        }
        self.installInfo = nil
    }
    
    // MARK: private
    
    private let fromItem: ConstraintItem
    private var toItem: ConstraintItem
    private var relation: ConstraintRelation?
    private var constant: Any = Float(0.0)
    private var multiplier: Float = 1.0
    private var priority: Float = 1000.0
    private var offset: Any = Float(0.0)
    
    private var installInfo: ConstraintInstallInfo?
    
    private func addConstraint(attributes: ConstraintAttributes) -> MutableConstraint {
        if self.relation == nil {
            self.fromItem.attributes += attributes
        }
        return self
    }
    
    private func constrainTo(other: ConstraintItem, relation: ConstraintRelation) -> MutableConstraint {
        if other.attributes != ConstraintAttributes.None {
            let toLayoutAttributes = other.attributes.layoutAttributes
            if toLayoutAttributes.count > 1 {
                let fromLayoutAttributes = self.fromItem.attributes.layoutAttributes
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
    private func constrainTo(other: View, relation: ConstraintRelation) -> MutableConstraint {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation)
    }
    #if os(iOS)
    private func constrainTo(other: UILayoutSupport, relation: ConstraintRelation) -> MutableConstraint {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation)
    }
    #endif
    private func constrainTo(other: Float, relation: ConstraintRelation) -> MutableConstraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: Double, relation: ConstraintRelation) -> MutableConstraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: CGSize, relation: ConstraintRelation) -> MutableConstraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: CGPoint, relation: ConstraintRelation) -> MutableConstraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: EdgeInsets, relation: ConstraintRelation) -> MutableConstraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    
    private class func closestCommonSuperviewFromView(fromView: View?, toView: View?) -> View? {
        var views = Set<View>()
        var fromView = fromView
        var toView = toView
        do {
            if let view = toView {
                if views.contains(view) {
                    return view
                }
                views.insert(view)
                toView = view.superview
            }
            if let view = fromView {
                if views.contains(view) {
                    return view
                }
                views.insert(view)
                fromView = view.superview
            }
        } while (fromView != nil || toView != nil)
        
        return nil
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
            #if os(iOS)
            switch self {
            case .Left, .CenterX, .LeftMargin, .CenterXWithinMargins: return point.x
            case .Top, .CenterY, .TopMargin, .CenterYWithinMargins, .Baseline, .FirstBaseline: return point.y
            case .Right, .RightMargin: return -point.x
            case .Bottom, .BottomMargin: return -point.y
            case .Leading, .LeadingMargin: return (Config.interfaceLayoutDirection == .LeftToRight) ? point.x : -point.x
            case .Trailing, .TrailingMargin: return (Config.interfaceLayoutDirection == .LeftToRight) ? -point.x : point.x
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #else
            switch self {
            case .Left, .CenterX: return point.x
            case .Top, .CenterY, .Baseline: return point.y
            case .Right: return -point.x
            case .Bottom: return -point.y
            case .Leading: return (Config.interfaceLayoutDirection == .LeftToRight) ? point.x : -point.x
            case .Trailing: return (Config.interfaceLayoutDirection == .LeftToRight) ? -point.x : point.x
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #endif
        }
        // EdgeInsets
        else if let insets = value as? EdgeInsets {
            #if os(iOS)
            switch self {
            case .Left, .CenterX, .LeftMargin, .CenterXWithinMargins: return insets.left
            case .Top, .CenterY, .TopMargin, .CenterYWithinMargins, .Baseline, .FirstBaseline: return insets.top
            case .Right, .RightMargin: return -insets.right
            case .Bottom, .BottomMargin: return -insets.bottom
            case .Leading, .LeadingMargin: return (Config.interfaceLayoutDirection == .LeftToRight) ? insets.left : -insets.right
            case .Trailing, .TrailingMargin: return (Config.interfaceLayoutDirection == .LeftToRight) ? -insets.right : insets.left
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #else
            switch self {
            case .Left, .CenterX: return insets.left
            case .Top, .CenterY, .Baseline: return insets.top
            case .Right: return -insets.right
            case .Bottom: return -insets.bottom
            case .Leading: return (Config.interfaceLayoutDirection == .LeftToRight) ? insets.left : -insets.right
            case .Trailing: return (Config.interfaceLayoutDirection == .LeftToRight) ? -insets.right : insets.left
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #endif
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
            #if os(iOS)
            switch self {
            case .Left, .CenterX, .LeftMargin, .CenterXWithinMargins: return point.x
            case .Top, .CenterY, .TopMargin, .CenterYWithinMargins, .Baseline, .FirstBaseline: return point.y
            case .Right, .RightMargin: return point.x
            case .Bottom, .BottomMargin: return point.y
            case .Leading, .LeadingMargin: return point.x
            case .Trailing, .TrailingMargin: return point.x
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #else
            switch self {
            case .Left, .CenterX: return point.x
            case .Top, .CenterY, .Baseline: return point.y
            case .Right: return point.x
            case .Bottom: return point.y
            case .Leading: return point.x
            case .Trailing: return point.x
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #endif
        }
        // EdgeInsets
        else if let insets = value as? EdgeInsets {
            #if os(iOS)
            switch self {
            case .Left, .CenterX, .LeftMargin, .CenterXWithinMargins: return insets.left
            case .Top, .CenterY, .TopMargin, .CenterYWithinMargins, .Baseline, .FirstBaseline: return insets.top
            case .Right, .RightMargin: return insets.right
            case .Bottom, .BottomMargin: return insets.bottom
            case .Leading, .LeadingMargin: return (Config.interfaceLayoutDirection == .LeftToRight) ? insets.left : insets.right
            case .Trailing, .TrailingMargin: return (Config.interfaceLayoutDirection == .LeftToRight) ? insets.right : insets.left
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #else
            switch self {
            case .Left, .CenterX: return insets.left
            case .Top, .CenterY, .Baseline: return insets.top
            case .Right: return insets.right
            case .Bottom: return insets.bottom
            case .Leading: return (Config.interfaceLayoutDirection == .LeftToRight) ? insets.left : insets.right
            case .Trailing: return (Config.interfaceLayoutDirection == .LeftToRight) ? insets.right : insets.left
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #endif
        }
        
        return CGFloat(0);
    }
}

private struct ConstraintInstallInfo {
    
    weak var view: View? = nil
    let layoutConstraints: NSHashTable
    
}


internal func ==(left: MutableConstraint, right: MutableConstraint) -> Bool {
    return (left.fromItem == right.fromItem &&
            left.toItem == right.toItem &&
            left.relation == right.relation &&
            left.multiplier == right.multiplier &&
            left.priority == right.priority)
}