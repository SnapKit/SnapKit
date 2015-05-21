//
//  SnapKit
//
//  Copyright (c) 2011-2015 SnapKit Team - https://github.com/SnapKit
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
    Used to make constraints
*/
public class ConstraintMaker {
    
    /// left edge
    public var left: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.Left) }
    
    /// top edge
    public var top: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.Top) }
    
    /// right edge
    public var right: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.Right) }
    
    /// bottom edge
    public var bottom: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.Bottom) }
    
    /// leading edge
    public var leading: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.Leading) }
    
    /// trailing edge
    public var trailing: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.Trailing) }
    
    /// width dimension
    public var width: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.Width) }
    
    /// height dimension
    public var height: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.Height) }
    
    /// centerX dimension
    public var centerX: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.CenterX) }
    
    /// centerY dimension
    public var centerY: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.CenterY) }
    
    /// baseline position
    public var baseline: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.Baseline) }
    
    #if os(iOS)
    
    /// firse baseline position
    public var firstBaseline: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.FirstBaseline) }
    
    /// left margin
    public var leftMargin: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.LeftMargin) }
    
    /// right margin
    public var rightMargin: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.RightMargin) }
    
    /// top margin
    public var topMargin: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.TopMargin) }
    
    /// bottom margin
    public var bottomMargin: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.BottomMargin) }
    
    /// leading margin
    public var leadingMargin: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.LeadingMargin) }
    
    /// trailing margin
    public var trailingMargin: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.TrailingMargin) }
    
    /// centerX within margins
    public var centerXWithinMargins: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.CenterXWithinMargins) }
    
    /// centerY within margins
    public var centerYWithinMargins: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.CenterYWithinMargins) }
    
    #endif
    
    /// top + left + bottom + right edges
    public var edges: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.Edges) }
    
    /// width + height dimensions
    public var size: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.Size) }
    
    // centerX + centerY positions
    public var center: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.Center) }
    
    #if os(iOS)
    
    // top + left + bottom + right margins
    public var margins: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.Margins) }
    
    // centerX + centerY within margins
    public var centerWithinMargins: ConstraintDescriptionExtendable { return self.makeConstraintDescription(ConstraintAttributes.CenterWithinMargins) }
    
    #endif
    
    internal init(view: View) {
        self.view = view
    }
    
    internal let view: View
    internal var constraintDescriptions = [ConstraintDescription]()
    
    internal func makeConstraintDescription(attributes: ConstraintAttributes) -> ConstraintDescription {
        let item = ConstraintItem(object: self.view, attributes: attributes)
        let constraintDescription = ConstraintDescription(fromItem: item)
        self.constraintDescriptions.append(constraintDescription)
        return constraintDescription
    }
    
    internal class func prepareConstraints(view: View, @noescape closure: (make: ConstraintMaker) -> Void) -> [Constraint] {
        let maker = ConstraintMaker(view: view)
        closure(make: maker)
        
        return maker.constraintDescriptions.map { $0.constraint }
    }
    
    internal class func makeConstraints(view: View, @noescape closure: (make: ConstraintMaker) -> Void) {
        #if os(iOS)
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        #else
        view.translatesAutoresizingMaskIntoConstraints = false
        #endif
        let maker = ConstraintMaker(view: view)
        closure(make: maker)
        
        let constraints = maker.constraintDescriptions.map { $0.constraint as! ConcreteConstraint }
        for constraint in constraints {
            constraint.installOnView(updateExisting: false)
        }
    }
    
    internal class func remakeConstraints(view: View, @noescape closure: (make: ConstraintMaker) -> Void) {
        #if os(iOS)
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        #else
        view.translatesAutoresizingMaskIntoConstraints = false
        #endif
        let maker = ConstraintMaker(view: view)
        closure(make: maker)
        
        self.removeConstraints(view)
        let constraints = maker.constraintDescriptions.map { $0.constraint as! ConcreteConstraint }
        for constraint in constraints {
            constraint.installOnView(updateExisting: false)
        }
    }
    
    internal class func updateConstraints(view: View, @noescape closure: (make: ConstraintMaker) -> Void) {
        #if os(iOS)
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        #else
        view.translatesAutoresizingMaskIntoConstraints = false
        #endif
        let maker = ConstraintMaker(view: view)
        closure(make: maker)
        
        let constraints = maker.constraintDescriptions.map { $0.constraint as! ConcreteConstraint}
        for constraint in constraints {
            constraint.installOnView(updateExisting: true)
        }
    }
    
    internal class func removeConstraints(view: View) {
        for existingLayoutConstraint in view.snp_installedLayoutConstraints {
            existingLayoutConstraint.snp_constraint?.uninstall()
        }
    }
}