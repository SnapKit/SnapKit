//
//  SnapTests.swift
//  SnapTests
//
//  Created by Robert Payne on 20/09/14.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

import UIKit
import XCTest
import Snap

class SnapTests: XCTestCase {
    
    let container = UIView()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMakeConstraints() {
        let v1 = UIView()
        let v2 = UIView()
        self.container.addSubview(v1)
        self.container.addSubview(v2)
        
        v1.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(v2.snp_top).offset(50)
            make.left.equalTo(v2.snp_top).offset(50)
            return
        }
        v2.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(v1)
            return
        }
        
    }
    
    func testUpdateConstraints() {
        let v1 = UIView()
        let v2 = UIView()
        self.container.addSubview(v1)
        self.container.addSubview(v2)
        
        v1.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(v2.snp_top).offset(50)
            make.left.equalTo(v2.snp_top).offset(50)
            return
        }
        v1.snp_updateConstraints { (make) -> Void in
            make.top.equalTo(v2.snp_top).offset(15)
            return
        }
        
    }
    
    func testRemakeConstraints() {
        let v1 = UIView()
        let v2 = UIView()
        self.container.addSubview(v1)
        self.container.addSubview(v2)
        
        v1.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(v2.snp_top).offset(50)
            make.left.equalTo(v2.snp_top).offset(50)
            return
        }
        v1.snp_remakeConstraints { (make) -> Void in
            make.edges.equalTo(v2)
            return
        }
        
    }
    
    func testRemoveConstraints() {
        let v1 = UIView()
        let v2 = UIView()
        self.container.addSubview(v1)
        self.container.addSubview(v2)
        
        v1.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(v2.snp_top).offset(50)
            make.left.equalTo(v2.snp_top).offset(50)
            return
        }
        v1.snp_removeConstraints()
        
    }
    
}
