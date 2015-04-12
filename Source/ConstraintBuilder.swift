//
//  Snap
//
//  Copyright (c) 2011-2015 Masonry Team - https://github.com/Masonry
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
 * ConstraintBuilderFinalizable is a protocol that allows getting a finalized constraint
 */
public protocol ConstraintBuilderFinalizable: class {
    
    var constraint: Constraint { get }
    
}

/**
 * ConstraintBuilderPriortizable is a protocol that allows a constraint to be prioritized
 */
public protocol ConstraintBuilderPriortizable: ConstraintBuilderFinalizable {
    
    func priority(priority: Float) -> ConstraintBuilderFinalizable
    func priority(priority: Double) -> ConstraintBuilderFinalizable
    func priority(priority: CGFloat) -> ConstraintBuilderFinalizable
    func priority(priority: UInt) -> ConstraintBuilderFinalizable
    func priority(priority: Int) -> ConstraintBuilderFinalizable
    func priorityRequired() -> ConstraintBuilderFinalizable
    func priorityHigh() -> ConstraintBuilderFinalizable
    func priorityMedium() -> ConstraintBuilderFinalizable
    func priorityLow() -> ConstraintBuilderFinalizable
}

/**
 * ConstraintBuilderMultipliable is a protocol that allows a constraint to be multiplied
 */
public protocol ConstraintBuilderMultipliable: ConstraintBuilderPriortizable {
    
    func multipliedBy(amount: Float) -> ConstraintBuilderPriortizable
    func multipliedBy(amount: Double) -> ConstraintBuilderPriortizable
    func multipliedBy(amount: CGFloat) -> ConstraintBuilderPriortizable
    func multipliedBy(amount: Int) -> ConstraintBuilderPriortizable
    func multipliedBy(amount: UInt) -> ConstraintBuilderPriortizable
    
    func dividedBy(amount: Float) -> ConstraintBuilderPriortizable
    func dividedBy(amount: Double) -> ConstraintBuilderPriortizable
    func dividedBy(amount: CGFloat) -> ConstraintBuilderPriortizable
    func dividedBy(amount: Int) -> ConstraintBuilderPriortizable
    func dividedBy(amount: UInt) -> ConstraintBuilderPriortizable
}

/**
 * ConstraintBuilderOffsetable is a protocol that allows a constraint to be offset / inset
 */
public protocol ConstraintBuilderOffsetable: ConstraintBuilderMultipliable {
    
    func offset(amount: Float) -> ConstraintBuilderMultipliable
    func offset(amount: Double) -> ConstraintBuilderMultipliable
    func offset(amount: CGFloat) -> ConstraintBuilderMultipliable
    func offset(amount: Int) -> ConstraintBuilderMultipliable
    func offset(amount: UInt) -> ConstraintBuilderMultipliable
    func offset(amount: CGPoint) -> ConstraintBuilderMultipliable
    func offset(amount: CGSize) -> ConstraintBuilderMultipliable
    func offset(amount: EdgeInsets) -> ConstraintBuilderMultipliable
    
    func inset(amount: EdgeInsets) -> ConstraintBuilderMultipliable
    
    @availability(*, deprecated=0.10.0, renamed="inset")
    func insets(amount: EdgeInsets) -> ConstraintBuilderMultipliable
}



/**
 * ConstraintBuilderRelatable is a protocol that allows a constraint to be set related to another item/constant by equalTo, lessThanOrEqualTo or greaterThanOrEqualTo
 */
public protocol ConstraintBuilderRelatable: class {
    
    func equalTo(other: ConstraintItem) -> ConstraintBuilderOffsetable
    func equalTo(other: View) -> ConstraintBuilderOffsetable
    #if os(iOS)
    func equalTo(other: UILayoutSupport) -> ConstraintBuilderOffsetable
    #endif
    func equalTo(other: Float) -> ConstraintBuilderMultipliable
    func equalTo(other: Double) -> ConstraintBuilderMultipliable
    func equalTo(other: CGFloat) -> ConstraintBuilderMultipliable
    func equalTo(other: Int) -> ConstraintBuilderMultipliable
    func equalTo(other: UInt) -> ConstraintBuilderMultipliable
    func equalTo(other: CGSize) -> ConstraintBuilderMultipliable
    func equalTo(other: CGPoint) -> ConstraintBuilderMultipliable
    func equalTo(other: EdgeInsets) -> ConstraintBuilderMultipliable
    
    func lessThanOrEqualTo(other: ConstraintItem) -> ConstraintBuilderOffsetable
    func lessThanOrEqualTo(other: View) -> ConstraintBuilderOffsetable
    #if os(iOS)
    func lessThanOrEqualTo(other: UILayoutSupport) -> ConstraintBuilderOffsetable
    #endif
    func lessThanOrEqualTo(other: Float) -> ConstraintBuilderMultipliable
    func lessThanOrEqualTo(other: Double) -> ConstraintBuilderMultipliable
    func lessThanOrEqualTo(other: CGFloat) -> ConstraintBuilderMultipliable
    func lessThanOrEqualTo(other: Int) -> ConstraintBuilderMultipliable
    func lessThanOrEqualTo(other: UInt) -> ConstraintBuilderMultipliable
    func lessThanOrEqualTo(other: CGSize) -> ConstraintBuilderMultipliable
    func lessThanOrEqualTo(other: CGPoint) -> ConstraintBuilderMultipliable
    func lessThanOrEqualTo(other: EdgeInsets) -> ConstraintBuilderMultipliable
    
    func greaterThanOrEqualTo(other: ConstraintItem) -> ConstraintBuilderOffsetable
    func greaterThanOrEqualTo(other: View) -> ConstraintBuilderOffsetable
    #if os(iOS)
    func greaterThanOrEqualTo(other: UILayoutSupport) -> ConstraintBuilderOffsetable
    #endif
    func greaterThanOrEqualTo(other: Float) -> ConstraintBuilderMultipliable
    func greaterThanOrEqualTo(other: Double) -> ConstraintBuilderMultipliable
    func greaterThanOrEqualTo(other: CGFloat) -> ConstraintBuilderMultipliable
    func greaterThanOrEqualTo(other: Int) -> ConstraintBuilderMultipliable
    func greaterThanOrEqualTo(other: UInt) -> ConstraintBuilderMultipliable
    func greaterThanOrEqualTo(other: CGSize) -> ConstraintBuilderMultipliable
    func greaterThanOrEqualTo(other: CGPoint) -> ConstraintBuilderMultipliable
    func greaterThanOrEqualTo(other: EdgeInsets) -> ConstraintBuilderMultipliable

}

/**
 * ConstraintBuilderExtendable is a protocol that allows a constraint to be extended
 */
public protocol ConstraintBuilderExtendable: ConstraintBuilderRelatable {
    
    var left: ConstraintBuilderExtendable { get }
    var top: ConstraintBuilderExtendable { get }
    var bottom: ConstraintBuilderExtendable { get }
    var right: ConstraintBuilderExtendable { get }
    var leading: ConstraintBuilderExtendable { get }
    var trailing: ConstraintBuilderExtendable { get }
    var width: ConstraintBuilderExtendable { get }
    var height: ConstraintBuilderExtendable { get }
    var centerX: ConstraintBuilderExtendable { get }
    var centerY: ConstraintBuilderExtendable { get }
    var baseline: ConstraintBuilderExtendable { get }
    
    #if os(iOS)
    var firstBaseline: ConstraintBuilderExtendable { get }
    var leftMargin: ConstraintBuilderExtendable { get }
    var rightMargin: ConstraintBuilderExtendable { get }
    var topMargin: ConstraintBuilderExtendable { get }
    var bottomMargin: ConstraintBuilderExtendable { get }
    var leadingMargin: ConstraintBuilderExtendable { get }
    var trailingMargin: ConstraintBuilderExtendable { get }
    var centerXWithinMargins: ConstraintBuilderExtendable { get }
    var centerYWithinMargins: ConstraintBuilderExtendable { get }
    #endif
}

/**
 * ConstraintBuilder is a single item that defines all the properties for a single ConstraintMaker building chain
 */
final internal class ConstraintBuilder: Constraint, ConstraintBuilderExtendable, ConstraintBuilderOffsetable, ConstraintBuilderFinalizable {
    
    var left: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.Left) }
    var top: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.Top) }
    var right: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.Right) }
    var bottom: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.Bottom) }
    var leading: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.Leading) }
    var trailing: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.Trailing) }
    var width: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.Width) }
    var height: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.Height) }
    var centerX: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.CenterX) }
    var centerY: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.CenterY) }
    var baseline: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.Baseline) }
    
    #if os(iOS)
    var firstBaseline: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.FirstBaseline) }
    var leftMargin: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.LeftMargin) }
    var rightMargin: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.RightMargin) }
    var topMargin: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.TopMargin) }
    var bottomMargin: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.BottomMargin) }
    var leadingMargin: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.LeadingMargin) }
    var trailingMargin: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.TrailingMargin) }
    var centerXWithinMargins: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.CenterXWithinMargins) }
    var centerYWithinMargins: ConstraintBuilderExtendable { return self.addConstraint(ConstraintAttributes.CenterYWithinMargins) }
    #endif
    
    // MARK: initializer
    
    init(fromItem: ConstraintItem) {
        self.fromItem = fromItem
        self.toItem = ConstraintItem(object: nil, attributes: ConstraintAttributes.None)
    }
    
    // MARK: equalTo
    
    func equalTo(other: ConstraintItem) -> ConstraintBuilderOffsetable {
        return self.constrainTo(other, relation: .Equal)
    }
    func equalTo(other: View) -> ConstraintBuilderOffsetable {
        return self.constrainTo(other, relation: .Equal)
    }
    #if os(iOS)
    func equalTo(other: UILayoutSupport) -> ConstraintBuilderOffsetable {
        return self.constrainTo(other, relation: .Equal)
    }
    #endif
    func equalTo(other: Float) -> ConstraintBuilderMultipliable {
        return self.constrainTo(other, relation: .Equal)
    }
    func equalTo(other: Double) -> ConstraintBuilderMultipliable {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    func equalTo(other: CGFloat) -> ConstraintBuilderMultipliable {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    func equalTo(other: Int) -> ConstraintBuilderMultipliable {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    func equalTo(other: UInt) -> ConstraintBuilderMultipliable {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    func equalTo(other: CGSize) -> ConstraintBuilderMultipliable {
        return self.constrainTo(other, relation: .Equal)
    }
    func equalTo(other: CGPoint) -> ConstraintBuilderMultipliable {
        return self.constrainTo(other, relation: .Equal)
    }
    func equalTo(other: EdgeInsets) -> ConstraintBuilderMultipliable {
        return self.constrainTo(other, relation: .Equal)
    }
    
    // MARK: lessThanOrEqualTo
    
    func lessThanOrEqualTo(other: ConstraintItem) -> ConstraintBuilderOffsetable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: View) -> ConstraintBuilderOffsetable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    #if os(iOS)
    func lessThanOrEqualTo(other: UILayoutSupport) -> ConstraintBuilderOffsetable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    #endif
    func lessThanOrEqualTo(other: Float) -> ConstraintBuilderMultipliable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: Double) -> ConstraintBuilderMultipliable {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: CGFloat) -> ConstraintBuilderMultipliable {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: Int) -> ConstraintBuilderMultipliable {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: UInt) -> ConstraintBuilderMultipliable {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: CGSize) -> ConstraintBuilderMultipliable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: CGPoint) -> ConstraintBuilderMultipliable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: EdgeInsets) -> ConstraintBuilderMultipliable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    
    // MARK: greaterThanOrEqualTo
    
    func greaterThanOrEqualTo(other: ConstraintItem) -> ConstraintBuilderOffsetable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: View) -> ConstraintBuilderOffsetable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    #if os(iOS)
    func greaterThanOrEqualTo(other: UILayoutSupport) -> ConstraintBuilderOffsetable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    #endif
    func greaterThanOrEqualTo(other: Float) -> ConstraintBuilderMultipliable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: Double) -> ConstraintBuilderMultipliable {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: CGFloat) -> ConstraintBuilderMultipliable {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: Int) -> ConstraintBuilderMultipliable {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: UInt) -> ConstraintBuilderMultipliable {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: CGSize) -> ConstraintBuilderMultipliable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: CGPoint) -> ConstraintBuilderMultipliable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: EdgeInsets) -> ConstraintBuilderMultipliable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    
    // MARK: multiplier
    
    func multipliedBy(amount: Float) -> ConstraintBuilderPriortizable {
        self.multiplier = amount
        return self
    }
    func multipliedBy(amount: Double) -> ConstraintBuilderPriortizable {
        return self.multipliedBy(Float(amount))
    }
    func multipliedBy(amount: CGFloat) -> ConstraintBuilderPriortizable {
        return self.multipliedBy(Float(amount))
    }
    func multipliedBy(amount: Int) -> ConstraintBuilderPriortizable {
        return self.multipliedBy(Float(amount))
    }
    func multipliedBy(amount: UInt) -> ConstraintBuilderPriortizable {
        return self.multipliedBy(Float(amount))
    }
    
    func dividedBy(amount: Float) -> ConstraintBuilderPriortizable {
        self.multiplier = 1.0 / amount;
        return self
    }
    func dividedBy(amount: Double) -> ConstraintBuilderPriortizable {
        return self.dividedBy(Float(amount))
    }
    func dividedBy(amount: CGFloat) -> ConstraintBuilderPriortizable {
        return self.dividedBy(Float(amount))
    }
    func dividedBy(amount: Int) -> ConstraintBuilderPriortizable {
        return self.dividedBy(Float(amount))
    }
    func dividedBy(amount: UInt) -> ConstraintBuilderPriortizable {
        return self.dividedBy(Float(amount))
    }
    
    // MARK: priority
    
    func priority(priority: Float) -> ConstraintBuilderFinalizable {
        self.priority = priority
        return self
    }
    func priority(priority: Double) -> ConstraintBuilderFinalizable {
        return self.priority(Float(priority))
    }
    func priority(priority: CGFloat) -> ConstraintBuilderFinalizable {
        return self.priority(Float(priority))
    }
    func priority(priority: UInt) -> ConstraintBuilderFinalizable {
        return self.priority(Float(priority))
    }
    func priority(priority: Int) -> ConstraintBuilderFinalizable {
        return self.priority(Float(priority))
    }
    func priorityRequired() -> ConstraintBuilderFinalizable {
        return self.priority(1000.0)
    }
    func priorityHigh() -> ConstraintBuilderFinalizable {
        return self.priority(750.0)
    }
    func priorityMedium() -> ConstraintBuilderFinalizable {
        #if os(iOS)
        return self.priority(500.0)
        #else
        return self.priority(501.0)
        #endif
    }
    func priorityLow() -> ConstraintBuilderFinalizable {
        return self.priority(250.0)
    }
    
    // MARK: offset
    
    func offset(amount: Float) -> ConstraintBuilderMultipliable {
        self.constant = amount
        return self
    }
    func offset(amount: Double) -> ConstraintBuilderMultipliable {
        return self.offset(Float(amount))
    }
    func offset(amount: CGFloat) -> ConstraintBuilderMultipliable {
        return self.offset(Float(amount))
    }
    func offset(amount: Int) -> ConstraintBuilderMultipliable {
        return self.offset(Float(amount))
    }
    func offset(amount: UInt) -> ConstraintBuilderMultipliable {
        return self.offset(Float(amount))
    }
    func offset(amount: CGPoint) -> ConstraintBuilderMultipliable {
        self.constant = amount
        return self
    }
    func offset(amount: CGSize) -> ConstraintBuilderMultipliable {
        self.constant = amount
        return self
    }
    func offset(amount: EdgeInsets) -> ConstraintBuilderMultipliable {
        self.constant = amount
        return self
    }
    
    // MARK: inset
    
    func inset(amount: EdgeInsets) -> ConstraintBuilderMultipliable {
        self.constant = EdgeInsets(top: amount.top, left: amount.left, bottom: -amount.bottom, right: -amount.right)
        return self
    }
    func insets(amount: EdgeInsets) -> ConstraintBuilderMultipliable {
        return self.inset(amount)
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
            installOnView = ConstraintBuilder.closestCommonSuperviewFromView(self.fromItem.view, toView: self.toItem.view)
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
    
    private var installInfo: ConstraintInstallInfo?
    
    private func addConstraint(attributes: ConstraintAttributes) -> ConstraintBuilder {
        if self.relation == nil {
            self.fromItem.attributes += attributes
        }
        return self
    }
    
    private func constrainTo(other: ConstraintItem, relation: ConstraintRelation) -> ConstraintBuilder {
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
    private func constrainTo(other: View, relation: ConstraintRelation) -> ConstraintBuilder {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation)
    }
    #if os(iOS)
    private func constrainTo(other: UILayoutSupport, relation: ConstraintRelation) -> ConstraintBuilder {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation)
    }
    #endif
    private func constrainTo(other: Float, relation: ConstraintRelation) -> ConstraintBuilder {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: Double, relation: ConstraintRelation) -> ConstraintBuilder {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: CGSize, relation: ConstraintRelation) -> ConstraintBuilder {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: CGPoint, relation: ConstraintRelation) -> ConstraintBuilder {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: EdgeInsets, relation: ConstraintRelation) -> ConstraintBuilder {
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
            case .Leading, .LeadingMargin: return  (Config.interfaceLayoutDirection == .LeftToRight) ? insets.left : -insets.right
            case .Trailing, .TrailingMargin: return  (Config.interfaceLayoutDirection == .LeftToRight) ? insets.right : -insets.left
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #else
            switch self {
            case .Left, .CenterX: return insets.left
            case .Top, .CenterY, .Baseline: return insets.top
            case .Right: return insets.right
            case .Bottom: return insets.bottom
                case .Leading, .LeadingMargin: return  (Config.interfaceLayoutDirection == .LeftToRight) ? insets.left : -insets.right
                case .Trailing, .TrailingMargin: return  (Config.interfaceLayoutDirection == .LeftToRight) ? insets.right : -insets.left
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


internal func ==(left: ConstraintBuilder, right: ConstraintBuilder) -> Bool {
    return (left.fromItem == right.fromItem &&
            left.toItem == right.toItem &&
            left.relation == right.relation &&
            left.multiplier == right.multiplier &&
            left.priority == right.priority)
}