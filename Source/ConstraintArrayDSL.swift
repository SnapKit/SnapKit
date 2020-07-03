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


public struct ConstraintArrayDSL: ConstraintAttributesDSL {
    
    @discardableResult
    public func prepareConstraints(_ closure: (_ make: ConstraintMaker) -> Void) -> [Constraint] {
        var constraints = [Constraint]()
        self.views.forEach({ constraints.append(contentsOf: $0.snp.prepareConstraints(closure)) })
        return constraints
    }
    
    public func makeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        for view in views {
            view.snp.makeConstraints(closure)
        }
    }
    
    public func makeConstraints(_ closure: (_ make: ConstraintMaker, _ element: ConstraintView) -> Void) {
        for view in self.views {
            view.snp.makeConstraints({ closure($0, view) })
        }
    }
    
    public func updateConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        for view in self.views {
            view.snp.updateConstraints(closure)
        }
    }
    
    public func updateConstraints(_ closure: (_ make: ConstraintMaker, _ element: ConstraintView) -> Void) {
        for view in self.views {
            view.snp.updateConstraints({ closure($0, view) })
        }
    }
    
    public func remakeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        for view in self.views {
            view.snp.remakeConstraints(closure)
        }
    }
    
    public func remakeConstraints(_ closure: (_ make: ConstraintMaker, _ element: ConstraintView) -> Void) {
        for view in self.views {
            view.snp.remakeConstraints({ closure($0, view) })
        }
    }
    
    public func removeConstraints() {
        for view in self.views {
            view.snp.removeConstraints()
        }
    }
    
    public var target: AnyObject? {
        return self.views as AnyObject
    }
    
    internal let views: Array<ConstraintView>
    
    internal init(views: Array<ConstraintView>) {
        self.views = views
    }

}

public enum ConstraintAxis: Int {
    case horizontal, vertical
}

public extension ConstraintArrayDSL {
    
    func distributeViewsAlong(axis: ConstraintAxis, fixedSpacing: CGFloat, leadSpacing: CGFloat = 0, tailSpacing: CGFloat = 0) {
        
        guard
            !views.isEmpty,
            let tempSuperView = commonSuperviewOfViews() else {
            return
        }
        
        switch axis {
        case .horizontal:
            var previousView: ConstraintView?
            for (i, v) in self.views.enumerated() {
                v.snp.makeConstraints({ (make) in
                    if let prev = previousView {
                        make.width.equalTo(prev)
                        make.left.equalTo(prev.snp.right).offset(fixedSpacing)
                    } else {
                        make.left.equalTo(tempSuperView).offset(leadSpacing)
                    }
                    if (i == self.views.count - 1) {
                        make.right.equalTo(tempSuperView).offset(-tailSpacing)
                    }
                })
                previousView = v;
            }
        case .vertical:
            var previousView : ConstraintView?
            for (i, v) in self.views.enumerated() {
                v.snp.makeConstraints({ (make) in
                    if let prev = previousView {
                        make.height.equalTo(prev)
                        make.top.equalTo(prev.snp.bottom).offset(fixedSpacing)
                    } else {
                        make.top.equalTo(tempSuperView).offset(leadSpacing);
                    }
                    if (i == self.views.count - 1) {
                        make.bottom.equalTo(tempSuperView).offset(-tailSpacing);
                    }
                })
                previousView = v;
            }
        }
    }
    
    func distributeViewsAlong(axis: ConstraintAxis, fixedItemLength: CGFloat, leadSpacing: CGFloat = 0, tailSpacing: CGFloat = 0) {
        
        guard
            !views.isEmpty,
            let tempSuperView = commonSuperviewOfViews() else {
            return
        }
        
        switch axis {
        case .horizontal:
            var previousView : ConstraintView?
            for (i, v) in self.views.enumerated() {
                v.snp.makeConstraints({ (make) in
                    make.width.equalTo(fixedItemLength)
                    if let _ = previousView {
                        if (i == self.views.count - 1) {//last one
                            make.right.equalTo(tempSuperView).offset(-tailSpacing);
                        } else {
                            let offset = (CGFloat(1) - (CGFloat(i) / CGFloat(self.views.count - 1))) * (fixedItemLength + leadSpacing) - CGFloat(i) * tailSpacing / CGFloat(self.views.count - 1)
                            make.right.equalTo(tempSuperView).multipliedBy(CGFloat(i) / CGFloat(self.views.count - 1)).offset(offset)
                        }
                    } else {
                        make.left.equalTo(tempSuperView).offset(leadSpacing);
                    }
                })
                previousView = v;
            }
        case .vertical:
            var previousView : ConstraintView?
            for (i, v) in self.views.enumerated() {
                v.snp.makeConstraints({ (make) in
                    make.height.equalTo(fixedItemLength)
                    if let _ = previousView {
                        if (i == self.views.count - 1) {
                            make.bottom.equalTo(tempSuperView).offset(-tailSpacing);
                        } else {
                            let offset = (CGFloat(1) - (CGFloat(i) / CGFloat(self.views.count - 1))) *
                                (fixedItemLength + leadSpacing) -
                                CGFloat(i) * tailSpacing / CGFloat(self.views.count - 1)
                            make.bottom.equalTo(tempSuperView).multipliedBy(CGFloat(i) / CGFloat(self.views.count-1)).offset(offset)
                        }
                    } else {
                        make.top.equalTo(tempSuperView).offset(leadSpacing);
                    }
                })
                previousView = v;
            }
        }
    }
}

private extension ConstraintArrayDSL {
    
    func commonSuperviewOfViews() -> ConstraintView? {
        guard views.count > 1 else {
            return views.first!.superview
        }
        
        var commonSuperview: ConstraintView?
        var previousView: ConstraintView?
        for view in views {
            if previousView != nil {
                commonSuperview = view.closestCommonSuperview(commonSuperview)
            } else {
                commonSuperview = view
            }
            previousView = view
        }
        assert(commonSuperview != nil, "Can't constrain views that do not share a common superview. Make sure that all the views in this array have been added into the same view hierarchy.")
        return commonSuperview
    }
}

private extension ConstraintView {
    
    func closestCommonSuperview(_ view : ConstraintView?) -> ConstraintView? {
        var closestCommonSuperview: ConstraintView?
        var secondViewSuperview: ConstraintView? = view
        
        var cacheViews: Set = Set<ConstraintView>()
        while (secondViewSuperview != nil) {
            cacheViews.insert(secondViewSuperview!)
            secondViewSuperview = secondViewSuperview?.superview
        }
        
        var firstViewSuperview: ConstraintView?  = self
        while (closestCommonSuperview == nil && firstViewSuperview != nil) {
            if cacheViews.contains(firstViewSuperview!) {
                closestCommonSuperview = firstViewSuperview
            }
            firstViewSuperview = firstViewSuperview!.superview
        }
        return closestCommonSuperview
    }
}
