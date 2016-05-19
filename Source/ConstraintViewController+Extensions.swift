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


    public extension ConstraintViewController {
        
        @available(iOS, deprecated=0.30.0, message="Please use newer snp.* syntax.")
        public var topLayoutGuideTop: ConstraintItem {
            return self.snp.topLayoutGuideTop
        }
        
        @available(iOS, deprecated=0.30.0, message="Please use newer snp.* syntax.")
        public var topLayoutGuideBottom: ConstraintItem {
            return self.snp.topLayoutGuideBottom
        }
        
        @available(iOS, deprecated=0.30.0, message="Please use newer snp.* syntax.")
        public var bottomLayoutGuideTop: ConstraintItem {
            return self.snp.bottomLayoutGuideTop
        }
        
        @available(iOS, deprecated=0.30.0, message="Please use newer snp.* syntax.")
        public var bottomLayoutGuideBottom: ConstraintItem {
            return self.snp.bottomLayoutGuideBottom
        }
        
        public var snp: ConstraintViewControllerDSL {
            return ConstraintViewControllerDSL(viewController: self)
        }
        
    }

#endif
