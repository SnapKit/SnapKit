//
//  SnapKit
//
//  Copyright (c) 2011-2015 SnapKit Team - https://github.com/SnapKit
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
    Used to define `NSLayoutAttributes` in a more concise and composite manner
*/
internal struct ConstraintAttributes: RawOptionSetType, BooleanType {
    
    internal init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    internal init(_ rawValue: UInt) {
        self.init(rawValue: rawValue)
    }
    internal init(nilLiteral: ()) {
        self.rawValue = 0
    }
    
    internal private(set) var rawValue: UInt
    internal static var allZeros: ConstraintAttributes { return self(0) }
    internal static func convertFromNilLiteral() -> ConstraintAttributes { return self(0) }
    internal var boolValue: Bool { return self.rawValue != 0 }
    
    internal func toRaw() -> UInt { return self.rawValue }
    internal static func fromRaw(raw: UInt) -> ConstraintAttributes? { return self(raw) }
    internal static func fromMask(raw: UInt) -> ConstraintAttributes { return self(raw) }
    
    // normal
    
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
    
    #if os(iOS)
    internal static var FirstBaseline: ConstraintAttributes { return self(2048) }
    internal static var LeftMargin: ConstraintAttributes { return self(4096) }
    internal static var RightMargin: ConstraintAttributes { return self(8192) }
    internal static var TopMargin: ConstraintAttributes { return self(16384) }
    internal static var BottomMargin: ConstraintAttributes { return self(32768) }
    internal static var LeadingMargin: ConstraintAttributes { return self(65536) }
    internal static var TrailingMargin: ConstraintAttributes { return self(131072) }
    internal static var CenterXWithinMargins: ConstraintAttributes { return self(262144) }
    internal static var CenterYWithinMargins: ConstraintAttributes { return self(524288) }
    #endif
    
    // aggregates
    
    internal static var Edges: ConstraintAttributes { return self(15) }
    internal static var Size: ConstraintAttributes { return self(192) }
    internal static var Center: ConstraintAttributes { return self(768) }
    
    #if os(iOS)
    internal static var Margins: ConstraintAttributes { return self(61440) }
    internal static var CenterWithinMargins: ConstraintAttributes { return self(786432) }
    #endif
    
    internal var layoutAttributes:[NSLayoutAttribute] {
        var attrs = [NSLayoutAttribute]()
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
        #if os(iOS)
        if (self & ConstraintAttributes.FirstBaseline) {
            attrs.append(.FirstBaseline)
        }
        if (self & ConstraintAttributes.LeftMargin) {
            attrs.append(.LeftMargin)
        }
        if (self & ConstraintAttributes.RightMargin) {
            attrs.append(.RightMargin)
        }
        if (self & ConstraintAttributes.TopMargin) {
            attrs.append(.TopMargin)
        }
        if (self & ConstraintAttributes.BottomMargin) {
            attrs.append(.BottomMargin)
        }
        if (self & ConstraintAttributes.LeadingMargin) {
            attrs.append(.LeadingMargin)
        }
        if (self & ConstraintAttributes.TrailingMargin) {
            attrs.append(.TrailingMargin)
        }
        if (self & ConstraintAttributes.CenterXWithinMargins) {
            attrs.append(.CenterXWithinMargins)
        }
        if (self & ConstraintAttributes.CenterYWithinMargins) {
            attrs.append(.CenterYWithinMargins)
        }
        #endif
        return attrs
    }
}
internal func +=(inout left: ConstraintAttributes, right: ConstraintAttributes) {
    left = (left | right)
}
internal func -=(inout left: ConstraintAttributes, right: ConstraintAttributes) {
    left = left & ~right
}
internal func ==(left: ConstraintAttributes, right: ConstraintAttributes) -> Bool {
    return left.rawValue == right.rawValue
}
