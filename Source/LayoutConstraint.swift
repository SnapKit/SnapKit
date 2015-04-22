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
    Used to add extra information to the actual `NSLayoutConstraint`'s that will UIKit/AppKit will utilize
*/
public class LayoutConstraint: NSLayoutConstraint {
    
    internal var snp_constraint: Constraint? = nil
    
}

internal func ==(left: LayoutConstraint, right: LayoutConstraint) -> Bool {
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

