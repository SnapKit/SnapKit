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
    
    internal func constraintConstantTargetValueFor(layoutAttribute: NSLayoutAttribute) -> CGFloat {
        if let value = self as? CGFloat {
            return value
        }
        
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
        
        if let value = self as? CGSize {
            if layoutAttribute == .width {
                return value.width
            } else if layoutAttribute == .height {
                return value.height
            } else {
                return 0.0
            }
        }
        
        if let value = self as? CGPoint {
            #if os(iOS) || os(tvOS)
                switch layoutAttribute {
                case .left, .right, .leading, .trailing, .centerX, .leftMargin, .rightMargin, .leadingMargin, .trailingMargin, .centerXWithinMargins:
                    return value.x
                case .top, .bottom, .centerY, .topMargin, .bottomMargin, .centerYWithinMargins, .lastBaseline, .firstBaseline:
                    return value.y
                case .width, .height, .notAnAttribute:
                    return 0.0
                }
            #else
                switch layoutAttribute {
                case .left, .right, .leading, .trailing, .centerX:
                    return value.x
                case .top, .bottom, .centerY, .lastBaseline, .firstBaseline:
                    return value.y
                case .width, .height, .notAnAttribute:
                    return 0.0
                }
            #endif
        }
        
        if let value = self as? ConstraintInsets {
            #if os(iOS) || os(tvOS)
                switch layoutAttribute {
                case .left, .leftMargin, .centerX, .centerXWithinMargins:
                    return value.left
                case .top, .topMargin, .centerY, .centerYWithinMargins, .lastBaseline, .firstBaseline:
                    return value.top
                case .right, .rightMargin:
                    return -value.right
                case .bottom, .bottomMargin:
                    return -value.bottom
                case .leading, .leadingMargin:
                    return (ConstraintConfig.interfaceLayoutDirection == .leftToRight) ? value.left : value.right
                case .trailing, .trailingMargin:
                    return (ConstraintConfig.interfaceLayoutDirection == .leftToRight) ? -value.right : -value.left
                case .width:
                    return -(value.left + value.right)
                case .height:
                    return -(value.top + value.bottom)
                case .notAnAttribute:
                    return 0.0
                }
            #else
                switch layoutAttribute {
                case .left, .centerX:
                    return value.left
                case .top, .centerY, .lastBaseline, .firstBaseline:
                    return value.top
                case .right:
                    return -value.right
                case .bottom:
                    return -value.bottom
                case .leading:
                    return (ConstraintConfig.interfaceLayoutDirection == .leftToRight) ? value.left : value.right
                case .trailing:
                    return (ConstraintConfig.interfaceLayoutDirection == .leftToRight) ? -value.right : -value.left
                case .width:
                    return -(value.left + value.right)
                case .height:
                    return -(value.top + value.bottom)
                case .notAnAttribute:
                    return 0.0
                }
            #endif
        }
        
        return 0.0
    }
    
}
