#if os(iOS) || os(tvOS)
import UIKit
typealias View = UIView
extension View {
    var snp_constraints: [AnyObject] { return self.constraints }
}
#else
import AppKit
typealias View = NSView
extension View {
    var snp_constraints: [AnyObject] { return self.constraints }
}
#endif

import XCTest
import SnapKit

class SnapKitTests: XCTestCase {
    
    let container = View()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLayoutGuideConstraints() {
        #if os(iOS) || os(tvOS)
        let vc = UIViewController()
        vc.view = UIView(frame: CGRectMake(0, 0, 300, 300))
        
        vc.view.addSubview(self.container)
        
        self.container.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(vc.snp_topLayoutGuideBottom)
            make.bottom.equalTo(vc.snp_bottomLayoutGuideTop)
        }
        
        XCTAssertEqual(vc.view.snp_constraints.count, 6, "Should have 6 constraints installed")
        #endif
    }
    
    func testMakeConstraints() {
        let v1 = View()
        let v2 = View()
        self.container.addSubview(v1)
        self.container.addSubview(v2)
        
        v1.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(v2.snp_top).offset(50)
            make.left.equalTo(v2.snp_top).offset(50)
            return
        }
        
        XCTAssertEqual(self.container.snp_constraints.count, 2, "Should have 2 constraints installed")
        
        v2.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(v1)
            return
        }
        
        XCTAssertEqual(self.container.snp_constraints.count, 6, "Should have 6 constraints installed")
        
    }
    
    func testUpdateConstraints() {
        let v1 = View()
        let v2 = View()
        self.container.addSubview(v1)
        self.container.addSubview(v2)
        
        v1.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(v2.snp_top).offset(50)
            make.left.equalTo(v2.snp_top).offset(50)
            return
        }
        
        XCTAssertEqual(self.container.snp_constraints.count, 2, "Should have 2 constraints installed")
        
        v1.snp_updateConstraints { (make) -> Void in
            make.top.equalTo(v2.snp_top).offset(15)
            return
        }
        
        XCTAssertEqual(self.container.snp_constraints.count, 2, "Should still have 2 constraints installed")
        
    }
    
    func testRemakeConstraints() {
        let v1 = View()
        let v2 = View()
        self.container.addSubview(v1)
        self.container.addSubview(v2)
        
        v1.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(v2.snp_top).offset(50)
            make.left.equalTo(v2.snp_top).offset(50)
            return
        }
        
        XCTAssertEqual(self.container.snp_constraints.count, 2, "Should have 2 constraints installed")
        
        v1.snp_remakeConstraints { (make) -> Void in
            make.edges.equalTo(v2)
            return
        }
        
        XCTAssertEqual(self.container.snp_constraints.count, 4, "Should have 4 constraints installed")
        
    }
    
    func testRemoveConstraints() {
        let v1 = View()
        let v2 = View()
        self.container.addSubview(v1)
        self.container.addSubview(v2)
        
        v1.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(v2.snp_top).offset(50)
            make.left.equalTo(v2.snp_top).offset(50)
            return
        }
        
        XCTAssertEqual(self.container.snp_constraints.count, 2, "Should have 2 constraints installed")
        
        v1.snp_removeConstraints()
        
        XCTAssertEqual(self.container.snp_constraints.count, 0, "Should have 0 constraints installed")
        
    }
    
    func testPrepareConstraints() {
        let v1 = View()
        let v2 = View()
        self.container.addSubview(v1)
        self.container.addSubview(v2)
        
        let constraints = v1.snp_prepareConstraints { (make) -> Void in
            make.edges.equalTo(v2)
            return
        }
        
        XCTAssertEqual(self.container.snp_constraints.count, 0, "Should have 0 constraints installed")
        
        for constraint in constraints {
            constraint.install()
        }
        
        XCTAssertEqual(self.container.snp_constraints.count, 4, "Should have 4 constraints installed")
        
        for constraint in constraints {
            constraint.uninstall()
        }
        
        XCTAssertEqual(self.container.snp_constraints.count, 0, "Should have 0 constraints installed")
        
    }
    
    func testReinstallConstraints() {
        let v1 = View()
        let v2 = View()
        self.container.addSubview(v1)
        self.container.addSubview(v2)
        
        let constraints = v1.snp_prepareConstraints { (make) -> Void in
            make.edges.equalTo(v2)
            return
        }
        
        
        XCTAssertEqual(self.container.snp_constraints.count, 0, "Should have 0 constraints installed")
        
        for constraint in constraints {
            constraint.install()
        }
        
        XCTAssertEqual(self.container.snp_constraints.count, 4, "Should have 4 constraints installed")
        
        for constraint in constraints {
            constraint.install()
        }
        
        XCTAssertEqual(self.container.snp_constraints.count, 4, "Should have 0 constraints installed")
    }
    
    func testActivateDeactivateConstraints() {
        let v1 = View()
        let v2 = View()
        self.container.addSubview(v1)
        self.container.addSubview(v2)
        
        var c1: Constraint? = nil
        var c2: Constraint? = nil
        
        v1.snp_prepareConstraints { (make) -> Void in
            c1 = make.top.equalTo(v2.snp_top).offset(50).constraint
            c2 = make.left.equalTo(v2.snp_top).offset(50).constraint
            return
        }
        
        XCTAssertEqual(self.container.snp_constraints.count, 0, "Should have 0 constraints")
        
        c1?.activate()
        c2?.activate()
        
        XCTAssertEqual(self.container.snp_constraints.count, 2, "Should have 2 constraints")
        
        c1?.deactivate()
        c2?.deactivate()
        
        XCTAssertEqual(self.container.snp_constraints.count, 0, "Should have 0 constraints")
        
        c1?.uninstall()
        c2?.uninstall()
        
        XCTAssertEqual(self.container.snp_constraints.count, 0, "Should have 0 constraints")
        
        c1?.activate()
        c2?.activate()
        
        XCTAssertEqual(self.container.snp_constraints.count, 2, "Should have 2 constraints")
        
    }
    
}
