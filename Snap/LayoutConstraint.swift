//
//  Snap
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
* LayoutConstraint is a subclass of NSLayoutConstraint to assist Snap and also provide better debugging
*/
public class LayoutConstraint: NSLayoutConstraint {
    internal var constraint: Constraint?
}

public func ==(left: LayoutConstraint, right: LayoutConstraint) -> Bool {
    if left.firstItem !== right.firstItem {
        return false
    }
    if left.secondItem !== right.secondItem {
        return false
    }
    if left.firstAttribute != right.firstAttribute {
        return false
    }
    if left.secondAttribute != right.secondAttribute {
        return false
    }
    if left.relation != right.relation {
        return false
    }
    if left.priority != right.priority {
        return false
    }
    if left.multiplier != right.multiplier {
        return false
    }
    return true
}