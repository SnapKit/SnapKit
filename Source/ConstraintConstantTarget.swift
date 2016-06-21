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


public protocol ConstraintConstantTarget {
}

extension CGPoint: ConstraintConstantTarget {
}

extension CGSize: ConstraintConstantTarget {    
}

extension ConstraintInsets: ConstraintConstantTarget {
}

extension ConstraintConstantTarget {
    
    internal func layoutConstantForLayoutAttribute(layoutAttribute: NSLayoutAttribute) -> CGFloat {
        if let value = self as? Float {
            return CGFloat(value)
        }
        
        if let value = self as? Double {
            return CGFloat(value)
        }
        
        if let value = self as? Int {
            return CGFloat(value)
        }
        
        if let value = self as? UInt {
            return CGFloat(value)
        }
        
        if let value = self as? CGFloat {
            return value
        }
        
        if let value = self as? CGSize {
            if layoutAttribute == .Width {
                return value.width
            } else if layoutAttribute == .Height {
                return value.height
            } else {
                return 0.0
            }
        }
        
        
        if let value = self as? CGPoint {
            #if os(iOS) || os(tvOS)
                switch layoutAttribute {
                case .Left, .Right, .Leading, .Trailing, .CenterX, .LeftMargin, .RightMargin, .LeadingMargin, .TrailingMargin, .CenterXWithinMargins:
                    return value.x
                case .Top, .Bottom, .CenterY, .TopMargin, .BottomMargin, .CenterYWithinMargins, .LastBaseline, .FirstBaseline:
                    return value.y
                case .Width, .Height, .NotAnAttribute:
                    return 0.0
                }
            #else
                switch layoutAttribute {
                case .Left, .Right, .Leading, .Trailing, .CenterX:
                    return value.x
                case .Top, .Bottom, .CenterY, .LastBaseline, .FirstBaseline:
                    return value.y
                case .Width, .Height, .NotAnAttribute:
                    return 0.0
                }
            #endif
        }
        
        if let value = self as? ConstraintInsets {
            #if os(iOS) || os(tvOS)
                switch layoutAttribute {
                case .Left, .LeftMargin, .CenterX, .CenterXWithinMargins:
                    return value.left
                case .Top, .TopMargin, .CenterY, .CenterYWithinMargins, .LastBaseline, .FirstBaseline:
                    return value.top
                case .Right, .RightMargin:
                    return value.right
                case .Bottom, .BottomMargin:
                    return value.bottom
                case .Leading, .LeadingMargin:
                    return (ConstraintConfig.interfaceLayoutDirection == .LeftToRight) ? value.left : -value.right
                case .Trailing, .TrailingMargin:
                    return (ConstraintConfig.interfaceLayoutDirection == .LeftToRight) ? value.right : -value.left
                case .Width:
                    return -value.left + value.right
                case .Height:
                    return -value.top + value.bottom
                case .NotAnAttribute:
                    return 0.0
                }
            #else
                switch layoutAttribute {
                case .Left, .CenterX:
                    return value.left
                case .Top, .CenterY, .LastBaseline, .FirstBaseline:
                    return value.top
                case .Right:
                    return value.right
                case .Bottom:
                    return value.bottom
                case .Leading:
                    return (ConstraintConfig.interfaceLayoutDirection == .LeftToRight) ? value.left : -value.right
                case .Trailing:
                    return (ConstraintConfig.interfaceLayoutDirection == .LeftToRight) ? value.right : -value.left
                case .Width:
                    return -value.left + value.right
                case .Height:
                    return -value.top + value.bottom
                case .NotAnAttribute:
                    return 0.0
                }
            #endif
        }
        
        return 0.0
    }
    
}
