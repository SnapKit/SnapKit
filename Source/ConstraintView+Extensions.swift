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


public extension ConstraintView {
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_left: ConstraintItem { return self.snp.left }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_top: ConstraintItem { return self.snp.top }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_right: ConstraintItem { return self.snp.right }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_bottom: ConstraintItem { return self.snp.bottom }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_leading: ConstraintItem { return self.snp.leading }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_trailing: ConstraintItem { return self.snp.trailing }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_width: ConstraintItem { return self.snp.width }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_height: ConstraintItem { return self.snp.height }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_centerX: ConstraintItem { return self.snp.centerX }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_centerY: ConstraintItem { return self.snp.centerY }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_baseline: ConstraintItem { return self.snp.baseline }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, OSX 10.11, *)
    public var snp_lastBaseline: ConstraintItem { return self.snp.lastBaseline }
    
    @available(iOS, deprecated:3.0, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, OSX 10.11, *)
    public var snp_firstBaseline: ConstraintItem { return self.snp.firstBaseline }
    
    @available(iOS, deprecated:3.0, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    public var snp_leftMargin: ConstraintItem { return self.snp.leftMargin }
    
    @available(iOS, deprecated:3.0, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    public var snp_topMargin: ConstraintItem { return self.snp.topMargin }
    
    @available(iOS, deprecated:3.0, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    public var snp_rightMargin: ConstraintItem { return self.snp.rightMargin }
    
    @available(iOS, deprecated:3.0, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    public var snp_bottomMargin: ConstraintItem { return self.snp.bottomMargin }
    
    @available(iOS, deprecated:3.0, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    public var snp_leadingMargin: ConstraintItem { return self.snp.leadingMargin }
    
    @available(iOS, deprecated:3.0, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    public var snp_trailingMargin: ConstraintItem { return self.snp.trailingMargin }
    
    @available(iOS, deprecated:3.0, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    public var snp_centerXWithinMargins: ConstraintItem { return self.snp.centerXWithinMargins }
    
    @available(iOS, deprecated:3.0, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    public var snp_centerYWithinMargins: ConstraintItem { return self.snp.centerYWithinMargins }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_edges: ConstraintItem { return self.snp.edges }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_size: ConstraintItem { return self.snp.size }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public var snp_center: ConstraintItem { return self.snp.center }
    
    @available(iOS, deprecated:3.0, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    public var snp_margins: ConstraintItem { return self.snp.margins }
    
    @available(iOS, deprecated:3.0, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    public var snp_centerWithinMargins: ConstraintItem { return self.snp.centerWithinMargins }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public func snp_prepareConstraints(_ closure: (_ make: ConstraintMaker) -> Void) -> [Constraint] {
        return self.snp.prepareConstraints(closure)
    }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public func snp_makeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        self.snp.makeConstraints(closure)
    }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public func snp_remakeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        self.snp.remakeConstraints(closure)
    }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public func snp_updateConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        self.snp.updateConstraints(closure)
    }
    
    @available(*, deprecated:3.0, message:"Use newer snp.* syntax.")
    public func snp_removeConstraints() {
        self.snp.removeConstraints()
    }
    
    public var snp: ConstraintViewDSL {
        return ConstraintViewDSL(view: self)
    }
    
}
