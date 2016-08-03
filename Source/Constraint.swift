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


public class Constraint {
    
    internal let sourceLocation: (String, UInt)
    
    private let from: ConstraintItem
    private let to: ConstraintItem
    private let relation: ConstraintRelation
    private let multiplier: ConstraintMultiplierTarget
    private var constant: ConstraintConstantTarget
    private var priority: ConstraintPriorityTarget
    private var installInfo: ConstraintInstallInfo? = nil
    
    // MARK: Initialization
    
    internal init(from: ConstraintItem,
                  to: ConstraintItem,
                  relation: ConstraintRelation,
                  sourceLocation: (String, UInt),
                  multiplier: ConstraintMultiplierTarget,
                  constant: ConstraintConstantTarget,
                  priority: ConstraintPriorityTarget) {
        self.from = from
        self.to = to
        self.relation = relation
        self.sourceLocation = sourceLocation
        self.multiplier = multiplier
        self.constant = constant
        self.priority = priority
    }
    
    // MARK: Public
    
    public func install() -> [NSLayoutConstraint] {
        return self.installIfNeeded(updateExisting: false)
    }
    
    public func uninstall() {
        self.uninstallIfNeeded()
    }
    
    @available(iOS 8.0, OSX 10.10, *)
    public func activate() {
        self.activateIfNeeded()
    }
    
    @available(iOS 8.0, OSX 10.10, *)
    public func deactivate() {
        self.deactivateIfNeeded()
    }
    
    // MARK: Internal
    
    internal func installIfNeeded(updateExisting: Bool = false) -> [NSLayoutConstraint] {
        let installOnView: ConstraintView?
        
        if let view = self.to.view {
            guard let closestSuperview = closestCommonSuperviewFromView(self.from.view, toView: view) else {
                fatalError("Cannot Install Constraint. No common superview. (\(self.sourceLocation.0), \(self.sourceLocation.1))")
            }
            installOnView = closestSuperview
        } else if self.from.attributes.isSubset(of: ConstraintAttributes.Width + ConstraintAttributes.Height) {
            installOnView = self.from.view
        } else {
            guard let superview = self.from.view?.superview else {
                fatalError("Cannot Install Constraint. No superview. (\(self.sourceLocation.0), \(self.sourceLocation.1))")
            }
            installOnView = superview
        }
        
        guard self.installInfo?.view == nil ||
              self.installInfo?.view == installOnView else {
            fatalError("Cannot Install Constraint. Already installed on different view. (\(self.sourceLocation.0), \(self.sourceLocation.1))")
        }
        
        // setup array to store new layout constraints
        var newLayoutConstraints = [LayoutConstraint]()
        
        // get attributes
        let layoutFromAttributes = self.from.attributes.layoutAttributes
        let layoutToAttributes = self.to.attributes.layoutAttributes
        
        // get layout from
        let layoutFrom: ConstraintView = self.from.view!
        
        // get relation
        let layoutRelation = self.relation.layoutRelation
        
        for layoutFromAttribute in layoutFromAttributes {
            // get layout to attribute
            let layoutToAttribute = (layoutToAttributes.count > 0) ? layoutToAttributes[0] : layoutFromAttribute
            
            // get layout constant
            let layoutConstant: CGFloat = self.constant.layoutConstantForLayoutAttribute(layoutToAttribute)
            
            // get layout to
            #if os(iOS) || os(tvOS)
                var layoutTo: AnyObject? = self.to.view ?? self.to.layoutSupport
            #else
                var layoutTo: AnyObject? = self.to.view
            #endif
            if layoutTo == nil && layoutToAttribute != .width && layoutToAttribute != .height {
                layoutTo = installOnView
            }
            
            // create layout constraint
            let layoutConstraint = LayoutConstraint(
                item: layoutFrom,
                attribute: layoutFromAttribute,
                relatedBy: layoutRelation,
                toItem: layoutTo,
                attribute: layoutToAttribute,
                multiplier: self.multiplier.constraintMultiplierTargetValue,
                constant: layoutConstant
            )
            
            // set priority
            layoutConstraint.priority = self.priority.constraintPriorityTargetValue
            
            // set constraint
            layoutConstraint.constraint = self
            
            // append
            newLayoutConstraints.append(layoutConstraint)
        }
        
        // updating logic
        if updateExisting {
            
            // get existing constraints for this view
            let existingLayoutConstraints = layoutFrom.snp.installedLayoutConstraints.reversed()
            
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
        #if SNAPKIT_DEPLOYMENT_LEGACY && (os(iOS) || os(tvOS))
            if #available(iOS 8.0, *) {
                NSLayoutConstraint.activate(newLayoutConstraints)
            } else {
                installOnView?.addConstraints(newLayoutConstraints)
            }
        #else
            NSLayoutConstraint.activate(newLayoutConstraints)
        #endif
        
        // set install info
        self.installInfo = ConstraintInstallInfo(view: installOnView, layoutConstraints: NSHashTable.weakObjects())
        
        // store which layout constraints are installed for this constraint
        for layoutConstraint in newLayoutConstraints {
            self.installInfo!.layoutConstraints.add(layoutConstraint)
        }
        
        // store the layout constraints against the layout from view
        layoutFrom.snp.appendInstalledLayoutConstraints(newLayoutConstraints)
        
        return newLayoutConstraints
    }
    
    internal func uninstallIfNeeded() {
        defer {
            self.installInfo = nil
        }
        
        guard let installedLayoutConstraints = self.installInfo?.layoutConstraints.allObjects as? [LayoutConstraint],
              installedLayoutConstraints.count > 0 else {
            return
        }
        
        #if SNAPKIT_DEPLOYMENT_LEGACY && !os(OSX)
            if #available(iOS 8.0, *) {
                NSLayoutConstraint.deactivate(installedLayoutConstraints)
            } else if let installedOnView = installInfo?.view {
                installedOnView.removeConstraints(installedLayoutConstraints)
            }
        #else
            NSLayoutConstraint.deactivate(installedLayoutConstraints)
        #endif
        
        // remove the constraints from the from item view
        self.from.view?.snp.removeInstalledLayoutConstraints(installedLayoutConstraints)
    }
    
    internal func activateIfNeeded() {
        guard self.installInfo != nil else {
            _ = self.installIfNeeded()
            return
        }
        #if SNAPKIT_DEPLOYMENT_LEGACY
            guard #available(iOS 8.0, OSX 10.10, *) else {
                _ = self.installIfNeeded()
                return
            }
        #endif
        
        guard let layoutConstraints = self.installInfo?.layoutConstraints.allObjects as? [LayoutConstraint],
              layoutConstraints.count > 0 else {
                return
        }
        
        NSLayoutConstraint.activate(layoutConstraints)
    }
    
    internal func deactivateIfNeeded() {
        #if SNAPKIT_DEPLOYMENT_LEGACY
            guard #available(iOS 8.0, OSX 10.10, *) else {
                return
            }
        #endif
        
        guard let layoutConstraints = self.installInfo?.layoutConstraints.allObjects as? [LayoutConstraint],
              layoutConstraints.count > 0 else {
            return
        }
        
        NSLayoutConstraint.deactivate(layoutConstraints)
    }
    
}

private final class ConstraintInstallInfo {
    
    private weak var view: ConstraintView? = nil
    private let layoutConstraints: NSHashTable<AnyObject>
    
    private init(view: ConstraintView?, layoutConstraints: NSHashTable<AnyObject>) {
        self.view = view
        self.layoutConstraints = layoutConstraints
    }
    
}

private func closestCommonSuperviewFromView(_ fromView: ConstraintView?, toView: ConstraintView?) -> ConstraintView? {
    var views = Set<ConstraintView>()
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

private func ==(lhs: Constraint, rhs: Constraint) -> Bool {
    return (lhs.from == rhs.from &&
            lhs.to == rhs.to &&
            lhs.relation == rhs.relation &&
            lhs.multiplier.constraintMultiplierTargetValue == rhs.multiplier.constraintMultiplierTargetValue &&
            lhs.priority.constraintPriorityTargetValue == rhs.priority.constraintPriorityTargetValue)
}
