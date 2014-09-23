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
 * ConstraintAttributes is an options set that maps to NSLayoutAttributes.
 */
internal struct ConstraintAttributes: RawOptionSetType, BooleanType {
    
    internal init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    internal init(_ rawValue: UInt) {
        self.init(rawValue: rawValue)
    }
    
    internal private(set) var rawValue: UInt
    internal static var allZeros: ConstraintAttributes { return self(0) }
    internal static func convertFromNilLiteral() -> ConstraintAttributes { return self(0) }
    internal var boolValue: Bool { return self.rawValue != 0 }
    
    func toRaw() -> UInt { return self.rawValue }
    static func fromRaw(raw: UInt) -> ConstraintAttributes? { return self(raw) }
    static func fromMask(raw: UInt) -> ConstraintAttributes { return self(raw) }
    
    internal static var None: ConstraintAttributes { return self(0) }
    internal static var Left: ConstraintAttributes { return self(1) }
    internal static var Top: ConstraintAttributes {  return self(2) }
    internal static var Right: ConstraintAttributes { return self(4) }
    internal static var Bottom: ConstraintAttributes { return self(8) }
    internal static var Leading: ConstraintAttributes { return self(16) }
    internal static var Trailing: ConstraintAttributes { return self(32) }
    internal static var Width: ConstraintAttributes { return self(64) }
    internal static var Height: ConstraintAttributes { return self(128) }
    internal static var CenterX: ConstraintAttributes { return self(256) }
    internal static var CenterY: ConstraintAttributes { return self(512) }
    internal static var Baseline: ConstraintAttributes { return self(1024) }
    
    internal static var Edges: ConstraintAttributes { return self(15) }
    internal static var Size: ConstraintAttributes { return self(192) }
    internal static var Center: ConstraintAttributes { return self(768) }
    
    internal var layoutAttributes:Array<NSLayoutAttribute> {
        var attrs: Array<NSLayoutAttribute> = []
            if (self & ConstraintAttributes.Left) {
                attrs.append(.Left)
            }
            if (self & ConstraintAttributes.Top) {
                attrs.append(.Top)
            }
            if (self & ConstraintAttributes.Right) {
                attrs.append(.Right)
            }
            if (self & ConstraintAttributes.Bottom) {
                attrs.append(.Bottom)
            }
            if (self & ConstraintAttributes.Leading) {
                attrs.append(.Leading)
            }
            if (self & ConstraintAttributes.Trailing) {
                attrs.append(.Trailing)
            }
            if (self & ConstraintAttributes.Width) {
                attrs.append(.Width)
            }
            if (self & ConstraintAttributes.Height) {
                attrs.append(.Height)
            }
            if (self & ConstraintAttributes.CenterX) {
                attrs.append(.CenterX)
            }
            if (self & ConstraintAttributes.CenterY) {
                attrs.append(.CenterY)
            }
            if (self & ConstraintAttributes.Baseline) {
                attrs.append(.Baseline)
            }
            return attrs
    }
}
internal func += (inout left: ConstraintAttributes, right: ConstraintAttributes) {
    left = (left | right)
}
internal func -= (inout left: ConstraintAttributes, right: ConstraintAttributes) {
    left = left & ~right
}
internal func == (left: ConstraintAttributes, right: ConstraintAttributes) -> Bool {
    return left.rawValue == right.rawValue
}
