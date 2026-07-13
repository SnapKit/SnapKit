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

#if canImport(UIKit)
    import UIKit
#endif

public extension ConstraintViewDSL {
    
    #if canImport(UIKit)
    @available(iOS 11.0, tvOS 11.0, *)
    var safeAreaLayoutGuide: ConstraintLayoutGuideDSL {
        return ConstraintLayoutGuideDSL(guide: self.view.safeAreaLayoutGuide)
    }
    
    /// Convenience property to access safe area edges
    @available(iOS 11.0, tvOS 11.0, *)
    var safeAreaEdges: ConstraintItem {
        return ConstraintItem(target: self.view.safeAreaLayoutGuide, attributes: .edges)
    }
    
    /// Convenience property to access safe area top
    @available(iOS 11.0, tvOS 11.0, *)
    var safeAreaTop: ConstraintItem {
        return ConstraintItem(target: self.view.safeAreaLayoutGuide, attributes: .top)
    }
    
    /// Convenience property to access safe area bottom
    @available(iOS 11.0, tvOS 11.0, *)
    var safeAreaBottom: ConstraintItem {
        return ConstraintItem(target: self.view.safeAreaLayoutGuide, attributes: .bottom)
    }
    
    /// Convenience property to access safe area leading
    @available(iOS 11.0, tvOS 11.0, *)
    var safeAreaLeading: ConstraintItem {
        return ConstraintItem(target: self.view.safeAreaLayoutGuide, attributes: .leading)
    }
    
    /// Convenience property to access safe area trailing
    @available(iOS 11.0, tvOS 11.0, *)
    var safeAreaTrailing: ConstraintItem {
        return ConstraintItem(target: self.view.safeAreaLayoutGuide, attributes: .trailing)
    }
    
    /// Convenience property to access safe area center
    @available(iOS 11.0, tvOS 11.0, *)
    var safeAreaCenter: ConstraintItem {
        return ConstraintItem(target: self.view.safeAreaLayoutGuide, attributes: .center)
    }
    
    /// Convenience property to access safe area centerX
    @available(iOS 11.0, tvOS 11.0, *)
    var safeAreaCenterX: ConstraintItem {
        return ConstraintItem(target: self.view.safeAreaLayoutGuide, attributes: .centerX)
    }
    
    /// Convenience property to access safe area centerY
    @available(iOS 11.0, tvOS 11.0, *)
    var safeAreaCenterY: ConstraintItem {
        return ConstraintItem(target: self.view.safeAreaLayoutGuide, attributes: .centerY)
    }
    #endif
}

// MARK: - Convenience methods for common safe area constraints

public extension ConstraintViewDSL {
    
    #if canImport(UIKit)
    /// Make constraints to safe area edges with optional insets
    @available(iOS 11.0, tvOS 11.0, *)
    @discardableResult
    func makeConstraintsToSafeArea(insets: UIEdgeInsets = .zero, 
                                   closure: (_ make: ConstraintMaker) -> Void = { _ in }) -> [Constraint] {
        return self.prepareConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide).inset(insets)
            closure(make)
        }
    }
    
    /// Update constraints to safe area edges with optional insets
    @available(iOS 11.0, tvOS 11.0, *)
    func updateConstraintsToSafeArea(insets: UIEdgeInsets = .zero,
                                     closure: (_ make: ConstraintMaker) -> Void = { _ in }) {
        self.updateConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide).inset(insets)
            closure(make)
        }
    }
    
    /// Remake constraints to safe area edges with optional insets
    @available(iOS 11.0, tvOS 11.0, *)
    func remakeConstraintsToSafeArea(insets: UIEdgeInsets = .zero,
                                     closure: (_ make: ConstraintMaker) -> Void = { _ in }) {
        self.remakeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide).inset(insets)
            closure(make)
        }
    }
    #endif
}