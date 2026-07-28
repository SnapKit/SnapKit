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
#else
    import AppKit
#endif


public protocol ConstraintInsetTarget: ConstraintConstantTarget {
}

extension Int: ConstraintInsetTarget {
    public func asFloat() -> CGFloat? {
        CGFloat(self)
    }
    public func asSize() -> CGSize? {
        return nil
    }
    public func asPoint() -> CGPoint? {
        return nil
    }
    public func asConstraintInsets() -> ConstraintInsets? {
        return nil
    }
#if canImport(UIKit)
    public func asConstraintDirectionalInsets() -> ConstraintDirectionalInsets? {
        return nil
    }
#endif
}

extension UInt: ConstraintInsetTarget {
    public func asFloat() -> CGFloat? {
        CGFloat(self)
    }
    public func asSize() -> CGSize? {
        return nil
    }
    public func asPoint() -> CGPoint? {
        return nil
    }
    public func asConstraintInsets() -> ConstraintInsets? {
        return nil
    }
#if canImport(UIKit)
    public func asConstraintDirectionalInsets() -> ConstraintDirectionalInsets? {
        return nil
    }
#endif
}

extension Float: ConstraintInsetTarget {
    public func asFloat() -> CGFloat? {
        CGFloat(self)
    }
    public func asSize() -> CGSize? {
        return nil
    }
    public func asPoint() -> CGPoint? {
        return nil
    }
    public func asConstraintInsets() -> ConstraintInsets? {
        return nil
    }
#if canImport(UIKit)
    public func asConstraintDirectionalInsets() -> ConstraintDirectionalInsets? {
        return nil
    }
#endif
}

extension Double: ConstraintInsetTarget {
    public func asFloat() -> CGFloat? {
        CGFloat(self)
    }
    public func asSize() -> CGSize? {
        return nil
    }
    public func asPoint() -> CGPoint? {
        return nil
    }
    public func asConstraintInsets() -> ConstraintInsets? {
        return nil
    }
#if canImport(UIKit)
    public func asConstraintDirectionalInsets() -> ConstraintDirectionalInsets? {
        return nil
    }
#endif
}

extension CGFloat: ConstraintInsetTarget {
    public func asFloat() -> CGFloat? {
        self
    }
    public func asSize() -> CGSize? {
        return nil
    }
    public func asPoint() -> CGPoint? {
        return nil
    }
    public func asConstraintInsets() -> ConstraintInsets? {
        return nil
    }
#if canImport(UIKit)
    public func asConstraintDirectionalInsets() -> ConstraintDirectionalInsets? {
        return nil
    }
#endif
}

extension ConstraintInsets: ConstraintInsetTarget {
    public func asFloat() -> CGFloat? {
        nil
    }
    public func asSize() -> CGSize? {
        return nil
    }
    public func asPoint() -> CGPoint? {
        return nil
    }
    public func asConstraintInsets() -> ConstraintInsets? {
        return self
    }
#if canImport(UIKit)
    public func asConstraintDirectionalInsets() -> ConstraintDirectionalInsets? {
        return nil
    }
#endif
}

extension ConstraintInsetTarget {

    internal var constraintInsetTargetValue: ConstraintInsets {
        if let amount = self.asConstraintInsets() {
            return amount
        } else if let amount = self.asFloat() {
            return ConstraintInsets(top: amount, left: amount, bottom: amount, right: amount)
        } else {
            return ConstraintInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }

}
