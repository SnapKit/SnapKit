//
//  UpdateTests.swift
//  Snap
//
//  Created by 전수열 on 1/12/15.
//  Copyright (c) 2015 Jonas Budelmann. All rights reserved.
//

import Foundation
import XCTest

#if os(iOS)
import UIKit
#else
import AppKit
#endif

class UpdateTests: XCTestCase {

    var superview: View!
    var view1: View!
    var view2: View!

    override func setUp() {
        super.setUp()
        self.superview = View(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        self.view1 = View(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        self.superview.addSubview(self.view1)
        self.view2 = View(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        self.superview.addSubview(self.view2)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testUpdateConstant() {
        self.view1.snp_makeConstraints { make in
            make.width.equalTo(100)
            return
        }
        self.view1.layoutIfNeeded()

        self.view1.snp_updateConstraints { make in
            make.width.equalTo(200)
            return
        }
        self.view1.layoutIfNeeded()

        XCTAssert(CGRectGetWidth(self.view1.frame) == 200)
        XCTAssert(self.view1.snp_installedLayoutConstraints.count == 1)
    }

    func testUpdatePriority() {
        self.view1.snp_makeConstraints { make in
            make.width.equalTo(self.superview).with.priority(100)
            make.width.equalTo(self.view2).with.priority(500)
        }
        self.view1.layoutIfNeeded()

        self.view1.snp_updateConstraints { make in
            make.width.equalTo(self.superview).with.priority(999)
            return
        }
        self.view1.layoutIfNeeded()

        XCTAssert(CGRectGetWidth(self.view1.frame) == CGRectGetWidth(self.superview.frame))
        XCTAssert(self.view1.snp_installedLayoutConstraints.count == 2)
    }

    func testReplaceConstraintsFromConstantToRelation() {
        self.view1.snp_makeConstraints { make in
            make.width.equalTo(100)
            return
        }
        self.view1.layoutIfNeeded()

        self.view1.snp_updateConstraints { make in
            make.width.equalTo(self.view2).with.offset(50)
            return
        }
        self.view1.layoutIfNeeded()

        XCTAssert(CGRectGetWidth(self.view1.frame) == CGRectGetWidth(self.view2.frame) + 50)
        XCTAssert(self.view1.snp_installedLayoutConstraints.count == 1)
    }

    func testReplaceConstraintsFromRelationToConstant() {
        self.view1.snp_makeConstraints { make in
            make.width.equalTo(self.view2).with.offset(50)
            return
        }
        self.view1.layoutIfNeeded()

        self.view1.snp_updateConstraints { make in
            make.width.equalTo(100)
            return
        }
        self.view1.layoutIfNeeded()

        XCTAssert(CGRectGetWidth(self.view1.frame) == 100)
        XCTAssert(self.view1.snp_installedLayoutConstraints.count == 1)
    }

    func testReplaceConstraintsToAnotherRelation() {
        self.view1.snp_makeConstraints { make in
            make.width.equalTo(self.superview).with.offset(50)
            return
        }
        self.view1.layoutIfNeeded()

        self.view1.snp_updateConstraints { make in
            make.width.equalTo(self.view2).with.offset(25)
            return
        }
        self.view1.layoutIfNeeded()

        XCTAssert(CGRectGetWidth(self.view1.frame) == CGRectGetWidth(self.view2.frame) + 25)
        XCTAssert(self.view1.snp_installedLayoutConstraints.count == 1)
    }

}
