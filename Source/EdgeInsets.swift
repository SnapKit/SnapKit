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
public typealias EdgeInsets = UIEdgeInsets
public func EdgeInsetsMake(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> EdgeInsets {
    return EdgeInsets(top: top, left: left, bottom: bottom, right: right)
}
public let EdgeInsetsZero = EdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
#else
import AppKit
public typealias EdgeInsets = NSEdgeInsets
public func EdgeInsetsMake(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> EdgeInsets {
    return EdgeInsets(top: top, left: left, bottom: bottom, right: right)
}
public let EdgeInsetsZero = EdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
#endif
