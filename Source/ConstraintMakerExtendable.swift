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


public class ConstraintMakerExtendable: ConstraintMakerRelatable {
    
    public var left: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.Left
        return self
    }
    
    public var top: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.Top
        return self
    }
    
    public var bottom: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.Bottom
        return self
    }
    
    public var right: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.Right
        return self
    }
    
    public var leading: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.Leading
        return self
    }
    
    public var trailing: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.Trailing
        return self
    }
    
    public var width: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.Width
        return self
    }
    
    public var height: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.Height
        return self
    }
    
    public var centerX: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.CenterX
        return self
    }
    
    public var centerY: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.CenterY
        return self
    }
    
    public var baseline: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.LastBaseline
        return self
    }
    
    @available(iOS 8.0, *)
    public var firstBaseline: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.FirstBaseline
        return self
    }
    
    @available(iOS 8.0, *)
    public var leftMargin: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.LeftMargin
        return self
    }
    
    @available(iOS 8.0, *)
    public var rightMargin: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.RightMargin
        return self
    }
    
    @available(iOS 8.0, *)
    public var bottomMargin: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.BottomMargin
        return self
    }
    
    @available(iOS 8.0, *)
    public var leadingMargin: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.LeadingMargin
        return self
    }
    
    @available(iOS 8.0, *)
    public var trailingMargin: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.TrailingMargin
        return self
    }
    
    @available(iOS 8.0, *)
    public var centerXWithinMargins: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.CenterXWithinMargins
        return self
    }
    
    @available(iOS 8.0, *)
    public var centerYWithinMargins: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.CenterYWithinMargins
        return self
    }
    
    public var edges: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.Edges
        return self
    }
    public var size: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.Size
        return self
    }
    
    @available(iOS 8.0, *)
    public var margins: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.Margins
        return self
    }
    
    @available(iOS 8.0, *)
    public var centerWithinMargins: ConstraintMakerExtendable {
        self.description.attributes += ConstraintAttributes.CenterWithinMargins
        return self
    }
    
}
