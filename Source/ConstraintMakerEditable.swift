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


public class ConstraintMakerEditable: ConstraintMakerPriortizable {

    @discardableResult
    public func multipliedBy(_ amount: ConstraintMultiplierTarget) -> ConstraintMakerEditable {
        self.description.multiplier = amount
        return self
    }
    
    @discardableResult
    public func dividedBy(_ amount: ConstraintMultiplierTarget) -> ConstraintMakerEditable {
        return self.multipliedBy(1.0 / amount.constraintMultiplierTargetValue)
    }
    
    @discardableResult
    public func offset(_ amount: ConstraintOffsetTarget) -> ConstraintMakerEditable {
        self.description.constant = amount.constraintOffsetTargetValue
        return self
    }
    
    @discardableResult
    public func inset(_ amount: ConstraintInsetTarget) -> ConstraintMakerEditable {
        self.description.constant = amount.constraintInsetTargetValue
        return self
    }
    
}
