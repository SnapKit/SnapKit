//
//  Snappy
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
 * ConstraintMaker is the maker in snappy that gets all constraints kickstarted
 */
class ConstraintMaker: SNPConstraintMaker {
    override var left: Constraint { return addConstraint(ConstraintAttributes.Left) }
    override var top: Constraint { return addConstraint(ConstraintAttributes.Top) }
    override var right: Constraint { return addConstraint(ConstraintAttributes.Right) }
    override var bottom: Constraint { return addConstraint(ConstraintAttributes.Bottom) }
    override var leading: Constraint { return addConstraint(ConstraintAttributes.Leading) }
    override var trailing: Constraint { return addConstraint(ConstraintAttributes.Trailing) }
    override var width: Constraint { return addConstraint(ConstraintAttributes.Width) }
    override var height: Constraint { return addConstraint(ConstraintAttributes.Height) }
    override var centerX: Constraint { return addConstraint(ConstraintAttributes.CenterX) }
    override var centerY: Constraint { return addConstraint(ConstraintAttributes.CenterY) }
    override var baseline: Constraint { return addConstraint(ConstraintAttributes.Baseline) }
    
    override var edges: Constraint { return addConstraint(ConstraintAttributes.Edges) }
    override var size: Constraint { return addConstraint(ConstraintAttributes.Size) }
    override var center: Constraint { return addConstraint(ConstraintAttributes.Center) }
    
    init(view: View) {
        self.view = view
    }
    
    internal weak var view: View?
    internal var constraints = Array<Constraint>()
    
    internal func addConstraint(attributes: ConstraintAttributes) -> Constraint {
        let item = ConstraintItem(view: self.view, attributes: attributes)
        let constraint = Constraint(fromItem: item)
        self.constraints.append(constraint)
        return constraint
    }
    
    internal class func makeConstraints(view: View, block: (make: ConstraintMaker) -> ()) {
        #if os(iOS)
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        #else
        view.translatesAutoresizingMaskIntoConstraints = false
        #endif
        let maker = ConstraintMaker(view: view)
        block(make: maker)
        
        var layoutConstraints: Array<LayoutConstraint> = []
        for constraint in maker.constraints {
            layoutConstraints += constraint.install()
        }
        LayoutConstraint.setLayoutConstraints(layoutConstraints, installedOnView: view)
    }
    
    internal class func remakeConstraints(view: View, block: (make: ConstraintMaker) -> ()) {
        #if os(iOS)
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        #else
        view.translatesAutoresizingMaskIntoConstraints = false
        #endif
        let maker = ConstraintMaker(view: view)
        block(make: maker)
        
        var layoutConstraints: Array<LayoutConstraint> = LayoutConstraint.layoutConstraintsInstalledOnView(view)
        for existingLayoutConstraint in layoutConstraints {
            existingLayoutConstraint.constraint?.uninstall()
        }
        layoutConstraints = []
        
        for constraint in maker.constraints {
            layoutConstraints += constraint.install()
        }
        LayoutConstraint.setLayoutConstraints(layoutConstraints, installedOnView: view)
    }
}

