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
internal struct ConstraintAttributes: OptionSetType, BooleanType {
    
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
    internal static var allZeros: ConstraintAttributes { return self.init(0) }
    internal static func convertFromNilLiteral() -> ConstraintAttributes { return self.init(0) }
    internal var boolValue: Bool { return self.rawValue != 0 }
    
    internal func toRaw() -> UInt { return self.rawValue }
    internal static func fromRaw(raw: UInt) -> ConstraintAttributes? { return self.init(raw) }
    internal static func fromMask(raw: UInt) -> ConstraintAttributes { return self.init(raw) }
    
    // normal
    
    internal static var None: ConstraintAttributes { return self.init(0) }
    internal static var Left: ConstraintAttributes { return self.init(1) }
    internal static var Top: ConstraintAttributes {  return self.init(2) }
    internal static var Right: ConstraintAttributes { return self.init(4) }
    internal static var Bottom: ConstraintAttributes { return self.init(8) }
    internal static var Leading: ConstraintAttributes { return self.init(16) }
    internal static var Trailing: ConstraintAttributes { return self.init(32) }
    internal static var Width: ConstraintAttributes { return self.init(64) }
    internal static var Height: ConstraintAttributes { return self.init(128) }
    internal static var CenterX: ConstraintAttributes { return self.init(256) }
    internal static var CenterY: ConstraintAttributes { return self.init(512) }
    internal static var Baseline: ConstraintAttributes { return self.init(1024) }
    
    @available(iOS 8.0, *)
    internal static var FirstBaseline: ConstraintAttributes { return self.init(2048) }
    @available(iOS 8.0, *)
    internal static var LeftMargin: ConstraintAttributes { return self.init(4096) }
    @available(iOS 8.0, *)
    internal static var RightMargin: ConstraintAttributes { return self.init(8192) }
    @available(iOS 8.0, *)
    internal static var TopMargin: ConstraintAttributes { return self.init(16384) }
    @available(iOS 8.0, *)
    internal static var BottomMargin: ConstraintAttributes { return self.init(32768) }
    @available(iOS 8.0, *)
    internal static var LeadingMargin: ConstraintAttributes { return self.init(65536) }
    @available(iOS 8.0, *)
    internal static var TrailingMargin: ConstraintAttributes { return self.init(131072) }
    @available(iOS 8.0, *)
    internal static var CenterXWithinMargins: ConstraintAttributes { return self.init(262144) }
    @available(iOS 8.0, *)
    internal static var CenterYWithinMargins: ConstraintAttributes { return self.init(524288) }
    
    // aggregates
    
    internal static var Edges: ConstraintAttributes { return self.init(15) }
    internal static var Size: ConstraintAttributes { return self.init(192) }
    internal static var Center: ConstraintAttributes { return self.init(768) }
    
    @available(iOS 8.0, *)
    internal static var Margins: ConstraintAttributes { return self.init(61440) }
    
    @available(iOS 8.0, *)
    internal static var CenterWithinMargins: ConstraintAttributes { return self.init(786432) }
    
    internal var layoutAttributes:[NSLayoutAttribute] {
        var attrs = [NSLayoutAttribute]()
        if (self.contains(ConstraintAttributes.Left)) {
            attrs.append(.Left)
        }
        if (self.contains(ConstraintAttributes.Top)) {
            attrs.append(.Top)
        }
        if (self.contains(ConstraintAttributes.Right)) {
            attrs.append(.Right)
        }
        if (self.contains(ConstraintAttributes.Bottom)) {
            attrs.append(.Bottom)
        }
        if (self.contains(ConstraintAttributes.Leading)) {
            attrs.append(.Leading)
        }
        if (self.contains(ConstraintAttributes.Trailing)) {
            attrs.append(.Trailing)
        }
        if (self.contains(ConstraintAttributes.Width)) {
            attrs.append(.Width)
        }
        if (self.contains(ConstraintAttributes.Height)) {
            attrs.append(.Height)
        }
        if (self.contains(ConstraintAttributes.CenterX)) {
            attrs.append(.CenterX)
        }
        if (self.contains(ConstraintAttributes.CenterY)) {
            attrs.append(.CenterY)
        }
        if (self.contains(ConstraintAttributes.Baseline)) {
            attrs.append(.Baseline)
        }
        
        #if os(iOS)
        #if SNAPKIT_DEPLOYMENT_LEGACY
        guard #available(iOS 8.0, *) else {
            return attrs
        }
        #endif
        if (self.contains(ConstraintAttributes.FirstBaseline)) {
            attrs.append(.FirstBaseline)
        }
        if (self.contains(ConstraintAttributes.LeftMargin)) {
            attrs.append(.LeftMargin)
        }
        if (self.contains(ConstraintAttributes.RightMargin)) {
            attrs.append(.RightMargin)
        }
        if (self.contains(ConstraintAttributes.TopMargin)) {
            attrs.append(.TopMargin)
        }
        if (self.contains(ConstraintAttributes.BottomMargin)) {
            attrs.append(.BottomMargin)
        }
        if (self.contains(ConstraintAttributes.LeadingMargin)) {
            attrs.append(.LeadingMargin)
        }
        if (self.contains(ConstraintAttributes.TrailingMargin)) {
            attrs.append(.TrailingMargin)
        }
        if (self.contains(ConstraintAttributes.CenterXWithinMargins)) {
            attrs.append(.CenterXWithinMargins)
        }
        if (self.contains(ConstraintAttributes.CenterYWithinMargins)) {
            attrs.append(.CenterYWithinMargins)
        }
        #endif
        
        return attrs
    }
}
internal func +=(inout left: ConstraintAttributes, right: ConstraintAttributes) {
    left.unionInPlace(right)
}
internal func -=(inout left: ConstraintAttributes, right: ConstraintAttributes) {
    left.subtractInPlace(right)
}
internal func ==(left: ConstraintAttributes, right: ConstraintAttributes) -> Bool {
    return left.rawValue == right.rawValue
}
