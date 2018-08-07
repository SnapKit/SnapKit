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


public protocol ConstraintOffsetTarget: ConstraintConstantTarget {
}

extension Int: ConstraintOffsetTarget {
}

extension UInt: ConstraintOffsetTarget {
}

extension Float: ConstraintOffsetTarget {
}

extension Double: ConstraintOffsetTarget {
}

extension CGFloat: ConstraintOffsetTarget {
}

extension ConstraintOffsetTarget {
    
    internal var constraintOffsetTargetValue: CGFloat {
        let offset: CGFloat
        switch self {
        case let amount as Float:
            offset = CGFloat(amount)
        case let amount as Double:
            offset = CGFloat(amount)
        case let amount as CGFloat:
            offset = CGFloat(amount)
        case let amount as Int:
            offset = CGFloat(amount)
        case let amount as UInt:
            offset = CGFloat(amount)
        default:
            offset = 0.0
        }
        return offset
    }
    
}
