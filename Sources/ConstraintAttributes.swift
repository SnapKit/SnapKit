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


internal struct ConstraintAttributes : OptionSet, ExpressibleByIntegerLiteral {
    
    typealias IntegerLiteralType = UInt
    
    internal init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    internal init(_ rawValue: UInt) {
        self.init(rawValue: rawValue)
    }
    internal init(nilLiteral: ()) {
        self.rawValue = 0
    }
    internal init(integerLiteral rawValue: IntegerLiteralType) {
        self.init(rawValue: rawValue)
    }
    
    internal private(set) var rawValue: UInt
    internal static var allZeros: ConstraintAttributes { return 0 }
    internal static func convertFromNilLiteral() -> ConstraintAttributes { return 0 }
    internal var boolValue: Bool { return self.rawValue != 0 }
    
    internal func toRaw() -> UInt { return self.rawValue }
    internal static func fromRaw(_ raw: UInt) -> ConstraintAttributes? { return self.init(raw) }
    internal static func fromMask(_ raw: UInt) -> ConstraintAttributes { return self.init(raw) }
    
    // normal
    
    internal static let none: ConstraintAttributes = 0
    internal static let left: ConstraintAttributes = ConstraintAttributes(UInt(1) << 0)
    internal static let top: ConstraintAttributes = ConstraintAttributes(UInt(1) << 1)
    internal static let right: ConstraintAttributes = ConstraintAttributes(UInt(1) << 2)
    internal static let bottom: ConstraintAttributes = ConstraintAttributes(UInt(1) << 3)
    internal static let leading: ConstraintAttributes = ConstraintAttributes(UInt(1) << 4)
    internal static let trailing: ConstraintAttributes = ConstraintAttributes(UInt(1) << 5)
    internal static let width: ConstraintAttributes = ConstraintAttributes(UInt(1) << 6)
    internal static let height: ConstraintAttributes = ConstraintAttributes(UInt(1) << 7)
    internal static let centerX: ConstraintAttributes = ConstraintAttributes(UInt(1) << 8)
    internal static let centerY: ConstraintAttributes = ConstraintAttributes(UInt(1) << 9)
    internal static let lastBaseline: ConstraintAttributes = ConstraintAttributes(UInt(1) << 10)
    
    @available(iOS 8.0, OSX 10.11, *)
    internal static let firstBaseline: ConstraintAttributes = ConstraintAttributes(UInt(1) << 11)

    @available(iOS 8.0, *)
    internal static let leftMargin: ConstraintAttributes = ConstraintAttributes(UInt(1) << 12)

    @available(iOS 8.0, *)
    internal static let rightMargin: ConstraintAttributes = ConstraintAttributes(UInt(1) << 13)

    @available(iOS 8.0, *)
    internal static let topMargin: ConstraintAttributes = ConstraintAttributes(UInt(1) << 14)

    @available(iOS 8.0, *)
    internal static let bottomMargin: ConstraintAttributes = ConstraintAttributes(UInt(1) << 15)

    @available(iOS 8.0, *)
    internal static let leadingMargin: ConstraintAttributes = ConstraintAttributes(UInt(1) << 16)

    @available(iOS 8.0, *)
    internal static let trailingMargin: ConstraintAttributes = ConstraintAttributes(UInt(1) << 17)

    @available(iOS 8.0, *)
    internal static let centerXWithinMargins: ConstraintAttributes = ConstraintAttributes(UInt(1) << 18)

    @available(iOS 8.0, *)
    internal static let centerYWithinMargins: ConstraintAttributes = ConstraintAttributes(UInt(1) << 19)
    
    // aggregates
    
    internal static let edges: ConstraintAttributes = [.horizontalEdges, .verticalEdges]
    internal static let horizontalEdges: ConstraintAttributes = [.left, .right]
    internal static let verticalEdges: ConstraintAttributes = [.top, .bottom]
    internal static let directionalEdges: ConstraintAttributes = [.directionalHorizontalEdges, .directionalVerticalEdges]
    internal static let directionalHorizontalEdges: ConstraintAttributes = [.leading, .trailing]
    internal static let directionalVerticalEdges: ConstraintAttributes = [.top, .bottom]
    internal static let size: ConstraintAttributes = [.width, .height]
    internal static let center: ConstraintAttributes = [.centerX, .centerY]

    @available(iOS 8.0, *)
    internal static let margins: ConstraintAttributes = [.leftMargin, .topMargin, .rightMargin, .bottomMargin]

    @available(iOS 8.0, *)
    internal static let directionalMargins: ConstraintAttributes = [.leadingMargin, .topMargin, .trailingMargin, .bottomMargin]

    @available(iOS 8.0, *)
    internal static let centerWithinMargins: ConstraintAttributes = [.centerXWithinMargins, .centerYWithinMargins]
    
    internal var layoutAttributes:[LayoutAttribute] {
        var attrs = [LayoutAttribute]()
        if (self.contains(ConstraintAttributes.left)) {
            attrs.append(.left)
        }
        if (self.contains(ConstraintAttributes.top)) {
            attrs.append(.top)
        }
        if (self.contains(ConstraintAttributes.right)) {
            attrs.append(.right)
        }
        if (self.contains(ConstraintAttributes.bottom)) {
            attrs.append(.bottom)
        }
        if (self.contains(ConstraintAttributes.leading)) {
            attrs.append(.leading)
        }
        if (self.contains(ConstraintAttributes.trailing)) {
            attrs.append(.trailing)
        }
        if (self.contains(ConstraintAttributes.width)) {
            attrs.append(.width)
        }
        if (self.contains(ConstraintAttributes.height)) {
            attrs.append(.height)
        }
        if (self.contains(ConstraintAttributes.centerX)) {
            attrs.append(.centerX)
        }
        if (self.contains(ConstraintAttributes.centerY)) {
            attrs.append(.centerY)
        }
        if (self.contains(ConstraintAttributes.lastBaseline)) {
            attrs.append(.lastBaseline)
        }
        
        #if canImport(UIKit)
            if (self.contains(ConstraintAttributes.firstBaseline)) {
                attrs.append(.firstBaseline)
            }
            if (self.contains(ConstraintAttributes.leftMargin)) {
                attrs.append(.leftMargin)
            }
            if (self.contains(ConstraintAttributes.rightMargin)) {
                attrs.append(.rightMargin)
            }
            if (self.contains(ConstraintAttributes.topMargin)) {
                attrs.append(.topMargin)
            }
            if (self.contains(ConstraintAttributes.bottomMargin)) {
                attrs.append(.bottomMargin)
            }
            if (self.contains(ConstraintAttributes.leadingMargin)) {
                attrs.append(.leadingMargin)
            }
            if (self.contains(ConstraintAttributes.trailingMargin)) {
                attrs.append(.trailingMargin)
            }
            if (self.contains(ConstraintAttributes.centerXWithinMargins)) {
                attrs.append(.centerXWithinMargins)
            }
            if (self.contains(ConstraintAttributes.centerYWithinMargins)) {
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
