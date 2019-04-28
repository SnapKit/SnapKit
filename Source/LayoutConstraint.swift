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


public class LayoutConstraint : NSLayoutConstraint {
    
    public var label: String? {
        get {
            return self.identifier
        }
        set {
            self.identifier = newValue
        }
    }
    
    internal weak var constraint: Constraint? = nil
    
}

internal func ==(lhs: LayoutConstraint, rhs: LayoutConstraint) -> Bool {
    #if os(OSX)
    // ensure first anchor items match
    guard let item1 = lhs.firstAnchor.item,
          let item2 = rhs.firstAnchor.item,
          item1 === item2 else {
        return false
    }

    // ensure second anchor items match
    guard ((lhs.secondAnchor?.item == nil && rhs.secondAnchor?.item == nil) ||
           (lhs.secondAnchor?.item === rhs.secondAnchor?.item)) else {
        return false
    }
    #else
    guard lhs.firstAnchor == rhs.firstAnchor else {
        return false
    }
    guard ((lhs.secondAnchor == nil && rhs.secondAnchor == nil) ||
           (lhs.secondAnchor! == rhs.secondAnchor!)) else {
        return false
    }
    #endif


    // ensure attributes, relation, priorty and multiplier match
    guard lhs.firstAttribute == rhs.firstAttribute &&
          lhs.secondAttribute == rhs.secondAttribute &&
          lhs.relation == rhs.relation &&
          lhs.priority == rhs.priority &&
          lhs.multiplier == rhs.multiplier else {
        return false
    }
    return true
}
