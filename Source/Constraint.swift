//
//  SnapKit
//
//  Copyright (c) 2011-Present SnapKit Team - https://github.com/SnapKit
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

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

/**
    Used to expose API's for a Constraint
*/
public class Constraint {
    
    public func install() -> [LayoutConstraint] { fatalError("Must be implemented by Concrete subclass.") }
    public func uninstall() -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func activate() -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func deactivate() -> Void { fatalError("Must be implemented by Concrete subclass.") }
    
    public func updateOffset(amount: Float) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updateOffset(amount: Double) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updateOffset(amount: CGFloat) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updateOffset(amount: Int) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updateOffset(amount: UInt) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updateOffset(amount: CGPoint) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updateOffset(amount: CGSize) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updateOffset(amount: EdgeInsets) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    
    public func updateInsets(amount: EdgeInsets) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    
    public func updatePriority(priority: Float) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updatePriority(priority: Double) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updatePriority(priority: CGFloat) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updatePriority(priority: UInt) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updatePriority(priority: Int) -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updatePriorityRequired() -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updatePriorityHigh() -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updatePriorityMedium() -> Void { fatalError("Must be implemented by Concrete subclass.") }
    public func updatePriorityLow() -> Void { fatalError("Must be implemented by Concrete subclass.") }
    
    internal var makerFile: String = "Unknown"
    internal var makerLine: UInt = 0
    
}

/**
    Used internally to implement a ConcreteConstraint
*/
internal class ConcreteConstraint: Constraint {
    
    internal override func updateOffset(amount: Float) -> Void {
        self.constant = amount
    }
    internal override func updateOffset(amount: Double) -> Void {
        self.updateOffset(Float(amount))
    }
    internal override func updateOffset(amount: CGFloat) -> Void {
        self.updateOffset(Float(amount))
    }
    internal override func updateOffset(amount: Int) -> Void {
        self.updateOffset(Float(amount))
    }
    internal override func updateOffset(amount: UInt) -> Void {
        self.updateOffset(Float(amount))
    }
    internal override func updateOffset(amount: CGPoint) -> Void {
        self.constant = amount
    }
    internal override func updateOffset(amount: CGSize) -> Void {
        self.constant = amount
    }
    internal override func updateOffset(amount: EdgeInsets) -> Void {
        self.constant = amount
    }
    
    internal override func updateInsets(amount: EdgeInsets) -> Void {
        self.constant = EdgeInsets(top: amount.top, left: amount.left, bottom: -amount.bottom, right: -amount.right)
    }
    
    internal override func updatePriority(priority: Float) -> Void {
        self.priority = priority
    }
    internal override func updatePriority(priority: Double) -> Void {
        self.updatePriority(Float(priority))
    }
    internal override func updatePriority(priority: CGFloat) -> Void {
        self.updatePriority(Float(priority))
    }
    internal override func updatePriority(priority: UInt) -> Void {
        self.updatePriority(Float(priority))
    }
    internal override func updatePriority(priority: Int) -> Void {
        self.updatePriority(Float(priority))
    }
    internal override func updatePriorityRequired() -> Void {
        self.updatePriority(Float(1000.0))
    }
    internal override func updatePriorityHigh() -> Void {
        self.updatePriority(Float(750.0))
    }
    internal override func updatePriorityMedium() -> Void {
        #if os(iOS) || os(tvOS)
        self.updatePriority(Float(500.0))
        #else
        self.updatePriority(Float(501.0))
        #endif
    }
    internal override func updatePriorityLow() -> Void {
        self.updatePriority(Float(250.0))
    }
    
    internal override func install() -> [LayoutConstraint] {
        return self.installOnView(updateExisting: false, file: self.makerFile, line: self.makerLine)
    }
    
    internal override func uninstall() -> Void {
        self.uninstallFromView()
    }
    
    internal override func activate() -> Void {
        guard self.installInfo != nil else {
            self.install()
            return
        }
        #if SNAPKIT_DEPLOYMENT_LEGACY
        guard #available(iOS 8.0, OSX 10.10, *) else {
            self.install()
            return
        }
        #endif
        let layoutConstraints = self.installInfo!.layoutConstraints.allObjects as! [LayoutConstraint]
        if layoutConstraints.count > 0 {
            NSLayoutConstraint.activateConstraints(layoutConstraints)
        }
    }
    
    internal override func deactivate() -> Void {
        guard self.installInfo != nil else {
            return
        }
        #if SNAPKIT_DEPLOYMENT_LEGACY
        guard #available(iOS 8.0, OSX 10.10, *) else {
            return
        }
        #endif
        let layoutConstraints = self.installInfo!.layoutConstraints.allObjects as! [LayoutConstraint]
        if layoutConstraints.count > 0 {
            NSLayoutConstraint.deactivateConstraints(layoutConstraints)
        }
    }
    
    private let fromItem: ConstraintItem
    private let toItem: ConstraintItem
    private let relation: ConstraintRelation
    private let multiplier: Float
    private var constant: Any {
        didSet {
            if let installInfo = self.installInfo {
                for layoutConstraint in installInfo.layoutConstraints.allObjects as! [LayoutConstraint] {
                    let attribute = (layoutConstraint.secondAttribute == .NotAnAttribute) ? layoutConstraint.firstAttribute : layoutConstraint.secondAttribute
                    layoutConstraint.constant = attribute.snp_constantForValue(self.constant)
                }
            }
        }
    }
    private var priority: Float {
        didSet {
            if let installInfo = self.installInfo {
                for layoutConstraint in installInfo.layoutConstraints.allObjects as! [LayoutConstraint] {
                    layoutConstraint.priority = self.priority
                }
            }
        }
    }
    
    private let label: String?
    
    private var installInfo: ConcreteConstraintInstallInfo? = nil
    
    internal init(fromItem: ConstraintItem, toItem: ConstraintItem, relation: ConstraintRelation, constant: Any, multiplier: Float, priority: Float, label: String? = nil) {
        self.fromItem = fromItem
        self.toItem = toItem
        self.relation = relation
        self.constant = constant
        self.multiplier = multiplier
        self.priority = priority
        self.label = label
    }
    
    internal func installOnView(updateExisting updateExisting: Bool = false, file: String? = nil, line: UInt? = nil) -> [LayoutConstraint] {
        var installOnView: View? = nil
        if self.toItem.view != nil {
            installOnView = closestCommonSuperviewFromView(self.fromItem.view, toView: self.toItem.view)
            if installOnView == nil {
                NSException(name: "Cannot Install Constraint", reason: "No common superview between views (@\(self.makerFile)#\(self.makerLine))", userInfo: nil).raise()
                return []
            }
        } else {
            
            if self.fromItem.attributes.isSubsetOf(ConstraintAttributes.Width.union(.Height)) {
                installOnView = self.fromItem.view
            } else {
                installOnView = self.fromItem.view?.superview
                if installOnView == nil {
                    NSException(name: "Cannot Install Constraint", reason: "Missing superview (@\(self.makerFile)#\(self.makerLine))", userInfo: nil).raise()
                    return []
                }
            }
        }
        
        if let installedOnView = self.installInfo?.view {
            if installedOnView != installOnView {
                NSException(name: "Cannot Install Constraint", reason: "Already installed on different view. (@\(self.makerFile)#\(self.makerLine))", userInfo: nil).raise()
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
        let layoutRelation: NSLayoutRelation = self.relation.layoutRelation
        
        for layoutFromAttribute in layoutFromAttributes {
            // get layout to attribute
            let layoutToAttribute = (layoutToAttributes.count > 0) ? layoutToAttributes[0] : layoutFromAttribute
            
            // get layout constant
            let layoutConstant: CGFloat = layoutToAttribute.snp_constantForValue(self.constant)
            
            // get layout to
            #if os(iOS) || os(tvOS)
            var layoutTo: AnyObject? = self.toItem.view ?? self.toItem.layoutSupport
            #else
            var layoutTo: AnyObject? = self.toItem.view
            #endif
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
            layoutConstraint.identifier = self.label
            
            // set priority
            layoutConstraint.priority = self.priority
            
            // set constraint
            layoutConstraint.snp_constraint = self
            
            newLayoutConstraints.append(layoutConstraint)
        }
        
        // special logic for updating
        if updateExisting {
            // get existing constraints for this view
            let existingLayoutConstraints = layoutFrom!.snp_installedLayoutConstraints.reverse()
            
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
        #if SNAPKIT_DEPLOYMENT_LEGACY && !os(OSX)
        if #available(iOS 8.0, *) {
            NSLayoutConstraint.activateConstraints(newLayoutConstraints)
        } else {
            installOnView!.addConstraints(newLayoutConstraints)
        }
        #else
            NSLayoutConstraint.activateConstraints(newLayoutConstraints)
        #endif
        
        // set install info
        self.installInfo = ConcreteConstraintInstallInfo(view: installOnView, layoutConstraints: NSHashTable.weakObjectsHashTable())
        
        // store which layout constraints are installed for this constraint
        for layoutConstraint in newLayoutConstraints {
            self.installInfo!.layoutConstraints.addObject(layoutConstraint)
        }
        
        // store the layout constraints against the layout from view
        layoutFrom!.snp_installedLayoutConstraints += newLayoutConstraints
        
        // return the new constraints
        return newLayoutConstraints
    }
    
    internal func uninstallFromView() {
        if let installInfo = self.installInfo,
            let installedLayoutConstraints = installInfo.layoutConstraints.allObjects as? [LayoutConstraint] {
                
                if installedLayoutConstraints.count > 0 {
                    // remove the constraints from the UIView's storage
                    #if SNAPKIT_DEPLOYMENT_LEGACY && !os(OSX)
                    if #available(iOS 8.0, *) {
                        NSLayoutConstraint.deactivateConstraints(installedLayoutConstraints)
                    } else if let installedOnView = installInfo.view {
                        installedOnView.removeConstraints(installedLayoutConstraints)
                    }
                    #else
                        NSLayoutConstraint.deactivateConstraints(installedLayoutConstraints)
                    #endif
                    
                    // remove the constraints from the from item view
                    if let fromView = self.fromItem.view {
                        fromView.snp_installedLayoutConstraints = fromView.snp_installedLayoutConstraints.filter {
                            return !installedLayoutConstraints.contains($0)
                        }
                    }
                }
                
        }
        self.installInfo = nil
    }
    
}

private struct ConcreteConstraintInstallInfo {
    
    weak var view: View? = nil
    let layoutConstraints: NSHashTable
    
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
            #if os(iOS) || os(tvOS)
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
                case .FirstBaseline: return point.y
                }
            #endif
        }
            // EdgeInsets
        else if let insets = value as? EdgeInsets {
            #if os(iOS) || os(tvOS)
                switch self {
                case .Left, .CenterX, .LeftMargin, .CenterXWithinMargins: return insets.left
                case .Top, .CenterY, .TopMargin, .CenterYWithinMargins, .Baseline, .FirstBaseline: return insets.top
                case .Right, .RightMargin: return insets.right
                case .Bottom, .BottomMargin: return insets.bottom
                case .Leading, .LeadingMargin: return  (Config.interfaceLayoutDirection == .LeftToRight) ? insets.left : -insets.right
                case .Trailing, .TrailingMargin: return  (Config.interfaceLayoutDirection == .LeftToRight) ? insets.right : -insets.left
                case .Width: return -insets.left + insets.right
                case .Height: return -insets.top + insets.bottom
                case .NotAnAttribute: return CGFloat(0)
                }
            #else
                switch self {
                case .Left, .CenterX: return insets.left
                case .Top, .CenterY, .Baseline: return insets.top
                case .Right: return insets.right
                case .Bottom: return insets.bottom
                case .Leading: return  (Config.interfaceLayoutDirection == .LeftToRight) ? insets.left : -insets.right
                case .Trailing: return  (Config.interfaceLayoutDirection == .LeftToRight) ? insets.right : -insets.left
                case .Width: return -insets.left + insets.right
                case .Height: return -insets.top + insets.bottom
                case .NotAnAttribute: return CGFloat(0)
                case .FirstBaseline: return insets.bottom
                }
            #endif
        }
        
        return CGFloat(0);
    }
}

private func closestCommonSuperviewFromView(fromView: View?, toView: View?) -> View? {
    var views = Set<View>()
    var fromView = fromView
    var toView = toView
    repeat {
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

private func ==(left: ConcreteConstraint, right: ConcreteConstraint) -> Bool {
    return (left.fromItem == right.fromItem &&
            left.toItem == right.toItem &&
            left.relation == right.relation &&
            left.multiplier == right.multiplier &&
            left.priority == right.priority)
}
