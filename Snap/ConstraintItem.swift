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
 * ConstraintItem is a class that is used while building constraints.
 */
public class ConstraintItem {
    
    internal init(object: AnyObject?, attributes: ConstraintAttributes) {
        self.object = object
        self.attributes = attributes
    }
    
    internal weak var object: AnyObject?
    internal var attributes: ConstraintAttributes
    
    internal var view: View? {
        get {
            if let view = self.object as? View {
                return view
            }
            return nil
        }
    }
    
    #if os(iOS)
    internal var layoutSupport: UILayoutSupport? {
        get {
            if let layoutSupport = self.object as? UILayoutSupport {
                return layoutSupport
            }
            return nil
        }
    }
    #endif
}


internal func ==(left: ConstraintItem, right: ConstraintItem) -> Bool {
    if left.object == nil {
        return false
    }
    if right.object == nil {
        return false
    }
    if left.object !== right.object {
        return false
    }
    if left.attributes != right.attributes {
        return false
    }
    return true
}