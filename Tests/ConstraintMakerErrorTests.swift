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

import XCTest
@testable import SnapKit

class ConstraintMakerErrorTests: XCTestCase {

    var container: View!
    var v1: View!

    override func setUp() {
        super.setUp()

        container = View()
        v1 = View()
    }

    func testEqualToSuperviewWithNoSuperview_returnsError() {
        var editable: ConstraintMakerEditable? = nil
        ConstraintMakerErrorHandler.shared.errorHandler = { _ in /* ignore */ }

        v1.snp.makeConstraints { (make) -> Void in
             editable = make.top.equalToSuperview()
        }

        guard let error = editable?.description.error,
            case .missingSuperview = error else {
            XCTFail()
            return
        }
    }

    func testMakeConstraintsWithError_callsErrorHandler() {
        var error: Error? = nil
        ConstraintMakerErrorHandler.shared.errorHandler = { error = $0 }

        v1.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
        }

        guard let constraintMakerError = error as? ConstraintMakerError,
            case .missingSuperview = constraintMakerError else {
            XCTFail()
            return
        }
    }
}
