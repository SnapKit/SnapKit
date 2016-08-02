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


internal struct ConstraintAttributes: OptionSet {
    
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
    internal static func fromRaw(_ raw: UInt) -> ConstraintAttributes? { return self.init(raw) }
    internal static func fromMask(_ raw: UInt) -> ConstraintAttributes { return self.init(raw) }
    
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
            attrs.append(.left)
        }
        if (self.contains(ConstraintAttributes.Top)) {
            attrs.append(.top)
        }
        if (self.contains(ConstraintAttributes.Right)) {
            attrs.append(.right)
        }
        if (self.contains(ConstraintAttributes.Bottom)) {
            attrs.append(.bottom)
        }
        if (self.contains(ConstraintAttributes.Leading)) {
            attrs.append(.leading)
        }
        if (self.contains(ConstraintAttributes.Trailing)) {
            attrs.append(.trailing)
        }
        if (self.contains(ConstraintAttributes.Width)) {
            attrs.append(.width)
        }
        if (self.contains(ConstraintAttributes.Height)) {
            attrs.append(.height)
        }
        if (self.contains(ConstraintAttributes.CenterX)) {
            attrs.append(.centerX)
        }
        if (self.contains(ConstraintAttributes.CenterY)) {
            attrs.append(.centerY)
        }
        if (self.contains(ConstraintAttributes.Baseline)) {
            attrs.append(.lastBaseline)
        }
        
        #if os(iOS) || os(tvOS)
            #if SNAPKIT_DEPLOYMENT_LEGACY
                guard #available(iOS 8.0, *) else {
                    return attrs
                }
            #endif
            if (self.contains(ConstraintAttributes.FirstBaseline)) {
                attrs.append(.firstBaseline)
            }
            if (self.contains(ConstraintAttributes.LeftMargin)) {
                attrs.append(.leftMargin)
            }
            if (self.contains(ConstraintAttributes.RightMargin)) {
                attrs.append(.rightMargin)
            }
            if (self.contains(ConstraintAttributes.TopMargin)) {
                attrs.append(.topMargin)
            }
            if (self.contains(ConstraintAttributes.BottomMargin)) {
                attrs.append(.bottomMargin)
            }
            if (self.contains(ConstraintAttributes.LeadingMargin)) {
                attrs.append(.leadingMargin)
            }
            if (self.contains(ConstraintAttributes.TrailingMargin)) {
                attrs.append(.trailingMargin)
            }
            if (self.contains(ConstraintAttributes.CenterXWithinMargins)) {
                attrs.append(.centerXWithinMargins)
            }
            if (self.contains(ConstraintAttributes.CenterYWithinMargins)) {
                attrs.append(.centerYWithinMargins)
            }
        #endif
        
        return attrs
    }
}

internal func + (left: ConstraintAttributes, right: ConstraintAttributes) -> ConstraintAttributes {
    return left.union(right)
}

internal func +=(left: inout ConstraintAttributes, right: ConstraintAttributes) {
    left.formUnion(right)
}

internal func -=(left: inout ConstraintAttributes, right: ConstraintAttributes) {
    left.subtract(right)
}

internal func ==(left: ConstraintAttributes, right: ConstraintAttributes) -> Bool {
    return left.rawValue == right.rawValue
}
