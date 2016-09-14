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


public class ConstraintMakerPriortizable: ConstraintMakerFinalizable {
    
    @discardableResult
    public func priority(_ amount: ConstraintPriorityTarget) -> ConstraintMakerFinalizable {
        self.description.priority = amount
        return self
    }
    
    @available(*, deprecated:3.0, message:"Use priority(_ amount: ConstraintPriorityTarget) instead.")
    @discardableResult
    public func priorityRequired() -> ConstraintMakerFinalizable {
        return self.priority(1000)
    }
    
    @available(*, deprecated:3.0, message:"Use priority(_ amount: ConstraintPriorityTarget) instead.")
    @discardableResult
    public func priorityHigh() -> ConstraintMakerFinalizable {
        return self.priority(750)
    }
    
    @available(*, deprecated:3.0, message:"Use priority(_ amount: ConstraintPriorityTarget) instead.")
    @discardableResult
    public func priorityMedium() -> ConstraintMakerFinalizable {
        #if os(iOS) || os(tvOS)
            return self.priority(500)
        #else
            return self.priority(501)
        #endif
    }
    
    @available(*, deprecated:3.0, message:"Use priority(_ amount: ConstraintPriorityTarget) instead.")
    @discardableResult
    public func priorityLow() -> ConstraintMakerFinalizable {
        return self.priority(250)
    }
    
}
