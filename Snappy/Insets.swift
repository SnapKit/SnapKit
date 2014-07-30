//
//  Insets.swift
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
typealias EdgeInsets = UIEdgeInsets
func EdgeInsetsMake(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> EdgeInsets {
    return EdgeInsets(top: top, left: left, bottom: bottom, right: right)
}
let EdgeInsetsZero = EdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
#else
import AppKit
struct EdgeInsets {
    var top: CGFloat // specify amount to inset (positive) for each of the edges. values can be negative to 'outset'
    var left: CGFloat
    var bottom: CGFloat
    var right: CGFloat
}
func EdgeInsetsMake(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> EdgeInsets {
    return EdgeInsets(top: top, left: left, bottom: bottom, right: right)
}
let EdgeInsetsZero = EdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
#endif
