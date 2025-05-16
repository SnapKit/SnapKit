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


public extension RawRepresentable where Self: ConstraintConstantTarget, Self.RawValue: ConstraintConstantTarget {

    public func constraintConstantTargetValueFor(layoutAttribute: LayoutAttribute) -> CGFloat {
        return rawValue.constraintConstantTargetValueFor(layoutAttribute: layoutAttribute)
    }

}

public extension RawRepresentable where Self: ConstraintMultiplierTarget, Self.RawValue: ConstraintMultiplierTarget {

    public var constraintMultiplierTargetValue: CGFloat {
        return rawValue.constraintMultiplierTargetValue
    }

}

public extension RawRepresentable where Self: ConstraintOffsetTarget, Self.RawValue: ConstraintOffsetTarget {

    public var constraintOffsetTargetValue: CGFloat {
        return rawValue.constraintOffsetTargetValue
    }

}

public extension RawRepresentable where Self: ConstraintInsetTarget, Self.RawValue: ConstraintInsetTarget {

    public var constraintInsetTargetValue: ConstraintInsets {
        return rawValue.constraintInsetTargetValue
    }

}
