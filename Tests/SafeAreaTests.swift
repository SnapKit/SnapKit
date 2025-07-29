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

#if canImport(UIKit)

import UIKit
import XCTest
@testable import SnapKit

@available(iOS 11.0, tvOS 11.0, *)
class SafeAreaTests: XCTestCase {
    
    var container: UIView!
    
    override func setUp() {
        super.setUp()
        self.container = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    }
    
    override func tearDown() {
        self.container = nil
        super.tearDown()
    }
    
    func testSafeAreaTopConstraint() {
        let view = UIView()
        container.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.top.equalTo(container.snp.safeAreaTop)
        }
        
        container.layoutIfNeeded()
        
        let constraints = container.constraints
        XCTAssertTrue(constraints.count > 0)
        
        if let constraint = constraints.first {
            XCTAssertTrue(constraint.firstItem === view || constraint.secondItem === view)
            XCTAssertTrue(constraint.firstItem === container.safeAreaLayoutGuide || 
                         constraint.secondItem === container.safeAreaLayoutGuide)
        }
    }
    
    func testSafeAreaBottomConstraint() {
        let view = UIView()
        container.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.bottom.equalTo(container.snp.safeAreaBottom)
        }
        
        container.layoutIfNeeded()
        
        let constraints = container.constraints
        XCTAssertTrue(constraints.count > 0)
    }
    
    func testSafeAreaLeadingTrailingConstraints() {
        let view = UIView()
        container.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.leading.equalTo(container.snp.safeAreaLeading)
            make.trailing.equalTo(container.snp.safeAreaTrailing)
        }
        
        container.layoutIfNeeded()
        
        let constraints = container.constraints
        XCTAssertTrue(constraints.count >= 2)
    }
    
    func testSafeAreaCenterConstraints() {
        let view = UIView()
        container.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.center.equalTo(container.snp.safeAreaCenter)
            make.size.equalTo(100)
        }
        
        container.layoutIfNeeded()
        
        XCTAssertTrue(container.constraints.count >= 2)
    }
    
    func testSafeAreaEdgesConstraint() {
        let view = UIView()
        container.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.edges.equalTo(container.snp.safeAreaEdges)
        }
        
        container.layoutIfNeeded()
        
        let constraints = container.constraints
        XCTAssertTrue(constraints.count >= 4) // top, bottom, leading, trailing
    }
    
    func testMakeConstraintsToSafeArea() {
        let view = UIView()
        container.addSubview(view)
        
        let constraints = view.snp.makeConstraintsToSafeArea()
        
        XCTAssertTrue(constraints.count >= 4)
        
        container.layoutIfNeeded()
    }
    
    func testMakeConstraintsToSafeAreaWithInsets() {
        let view = UIView()
        container.addSubview(view)
        
        let insets = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
        view.snp.makeConstraintsToSafeArea(insets: insets)
        
        container.layoutIfNeeded()
        
        // Verify constraints were created
        XCTAssertTrue(container.constraints.count >= 4)
    }
    
    func testMakeConstraintsToSafeAreaWithClosure() {
        let view = UIView()
        container.addSubview(view)
        
        view.snp.makeConstraintsToSafeArea { make in
            make.height.equalTo(50)
        }
        
        container.layoutIfNeeded()
        
        // Should have safe area edge constraints plus height constraint
        XCTAssertTrue(view.constraints.count >= 1) // height constraint
        XCTAssertTrue(container.constraints.count >= 4) // edge constraints
    }
    
    func testUpdateConstraintsToSafeArea() {
        let view = UIView()
        container.addSubview(view)
        
        // First make constraints
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        container.layoutIfNeeded()
        
        // Then update to safe area
        view.snp.updateConstraintsToSafeArea()
        
        container.layoutIfNeeded()
        
        XCTAssertTrue(container.constraints.count >= 4)
    }
    
    func testRemakeConstraintsToSafeArea() {
        let view = UIView()
        container.addSubview(view)
        
        // First make constraints
        view.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(100)
        }
        
        container.layoutIfNeeded()
        let initialConstraintCount = container.constraints.count + view.constraints.count
        
        // Remake to safe area
        view.snp.remakeConstraintsToSafeArea()
        
        container.layoutIfNeeded()
        let finalConstraintCount = container.constraints.count + view.constraints.count
        
        // Constraints should be different after remake
        XCTAssertNotEqual(initialConstraintCount, finalConstraintCount)
    }
}

#endif