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


struct ConstraintAttributes : OptionSet, ExpressibleByIntegerLiteral {
    
    typealias IntegerLiteralType = UInt
    
    init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    init(_ rawValue: UInt) {
        self.init(rawValue: rawValue)
    }
    init(nilLiteral: ()) {
        self.rawValue = 0
    }
    init(integerLiteral rawValue: IntegerLiteralType) {
        self.init(rawValue: rawValue)
    }
    
    private(set) var rawValue: UInt
    static var allZeros: ConstraintAttributes { return 0 }
    static func convertFromNilLiteral() -> ConstraintAttributes { return 0 }
    var boolValue: Bool { return self.rawValue != 0 }
    
    func toRaw() -> UInt { return self.rawValue }
    static func fromRaw(_ raw: UInt) -> ConstraintAttributes? { return self.init(raw) }
    static func fromMask(_ raw: UInt) -> ConstraintAttributes { return self.init(raw) }
    
    // normal
    
    static var none: ConstraintAttributes { return 0 }
    static var left: ConstraintAttributes { return 1 }
    static var top: ConstraintAttributes {  return 2 }
    static var right: ConstraintAttributes { return 4 }
    static var bottom: ConstraintAttributes { return 8 }
    static var leading: ConstraintAttributes { return 16 }
    static var trailing: ConstraintAttributes { return 32 }
    static var width: ConstraintAttributes { return 64 }
    static var height: ConstraintAttributes { return 128 }
    static var centerX: ConstraintAttributes { return 256 }
    static var centerY: ConstraintAttributes { return 512 }
    static var lastBaseline: ConstraintAttributes { return 1024 }
    
    @available(iOS 8.0, OSX 10.11, *)
    static var firstBaseline: ConstraintAttributes { return 2048 }
    
    @available(iOS 8.0, *)
    static var leftMargin: ConstraintAttributes { return 4096 }
    
    @available(iOS 8.0, *)
    static var rightMargin: ConstraintAttributes { return 8192 }
    
    @available(iOS 8.0, *)
    static var topMargin: ConstraintAttributes { return 16384 }
    
    @available(iOS 8.0, *)
    static var bottomMargin: ConstraintAttributes { return 32768 }
    
    @available(iOS 8.0, *)
    static var leadingMargin: ConstraintAttributes { return 65536 }
    
    @available(iOS 8.0, *)
    static var trailingMargin: ConstraintAttributes { return 131072 }
    
    @available(iOS 8.0, *)
    static var centerXWithinMargins: ConstraintAttributes { return 262144 }
    
    @available(iOS 8.0, *)
    static var centerYWithinMargins: ConstraintAttributes { return 524288 }
    
    // aggregates
    
    static var edges: ConstraintAttributes { return 15 }
    static var size: ConstraintAttributes { return 192 }
    static var center: ConstraintAttributes { return 768 }
    
    @available(iOS 8.0, *)
    static var margins: ConstraintAttributes { return 61440 }
    
    @available(iOS 8.0, *)
    static var centerWithinMargins: ConstraintAttributes { return 786432 }
    
    var layoutAttributes:[LayoutAttribute] {
        var attrs = [LayoutAttribute]()
        if (self.contains(.left)) {
            attrs.append(.left)
        }
        if (self.contains(.top)) {
            attrs.append(.top)
        }
        if (self.contains(.right)) {
            attrs.append(.right)
        }
        if (self.contains(.bottom)) {
            attrs.append(.bottom)
        }
        if (self.contains(.leading)) {
            attrs.append(.leading)
        }
        if (self.contains(.trailing)) {
            attrs.append(.trailing)
        }
        if (self.contains(.width)) {
            attrs.append(.width)
        }
        if (self.contains(.height)) {
            attrs.append(.height)
        }
        if (self.contains(.centerX)) {
            attrs.append(.centerX)
        }
        if (self.contains(.centerY)) {
            attrs.append(.centerY)
        }
        if (self.contains(.lastBaseline)) {
            attrs.append(.lastBaseline)
        }
        
        #if os(iOS) || os(tvOS)
            if (self.contains(.firstBaseline)) {
                attrs.append(.firstBaseline)
            }
            if (self.contains(.leftMargin)) {
                attrs.append(.leftMargin)
            }
            if (self.contains(.rightMargin)) {
                attrs.append(.rightMargin)
            }
            if (self.contains(.topMargin)) {
                attrs.append(.topMargin)
            }
            if (self.contains(.bottomMargin)) {
                attrs.append(.bottomMargin)
            }
            if (self.contains(.leadingMargin)) {
                attrs.append(.leadingMargin)
            }
            if (self.contains(.trailingMargin)) {
                attrs.append(.trailingMargin)
            }
            if (self.contains(.centerXWithinMargins)) {
                attrs.append(.centerXWithinMargins)
            }
            if (self.contains(.centerYWithinMargins)) {
                attrs.append(.centerYWithinMargins)
            }
        #endif
        
        return attrs
    }
}

func + (left: ConstraintAttributes, right: ConstraintAttributes) -> ConstraintAttributes {
    return left.union(right)
}

func +=(left: inout ConstraintAttributes, right: ConstraintAttributes) {
    left.formUnion(right)
}

func -=(left: inout ConstraintAttributes, right: ConstraintAttributes) {
    left.subtract(right)
}

func ==(left: ConstraintAttributes, right: ConstraintAttributes) -> Bool {
    return left.rawValue == right.rawValue
}
