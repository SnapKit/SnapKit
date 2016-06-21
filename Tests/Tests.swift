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
    
    func testSizeConstraints() {
        let view = View()
        self.container.addSubview(view)
        
        view.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(CGSizeMake(50, 50))
            make.left.top.equalTo(self.container)
        }
        
        XCTAssertEqual(view.snp_constraints.count, 2, "Should have 2 constraints")
        
        XCTAssertEqual(self.container.snp_constraints.count, 2, "Should have 2 constraints")
        
        
        let constraints = view.snp_constraints as! [NSLayoutConstraint]
        
        XCTAssertEqual(constraints[0].firstAttribute, NSLayoutAttribute.Width, "Should be width")
        XCTAssertEqual(constraints[1].firstAttribute, NSLayoutAttribute.Height, "Should be height")
        XCTAssertEqual(constraints[0].constant, 50, "Should be 50")
        XCTAssertEqual(constraints[1].constant, 50, "Should be 50")
    }
    
    func testConstraintIdentifier() {
        let identifier = "Test-Identifier"
        let view = View()
        self.container.addSubview(view)
        
        view.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.container.snp_top).labeled(identifier)
        }
        
        let constraints = container.snp_constraints as! [NSLayoutConstraint]
        XCTAssertEqual(constraints[0].identifier, identifier, "Identifier should be 'Test'")
    }
    
    func testSuperviewConstraints() {
        let view = View()
        
        container.addSubview(view)
        
        view.snp_makeConstraints { (make) -> Void in
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints")
        
        let constraints = container.snp_constraints as! [NSLayoutConstraint]
        
        XCTAssertEqual(constraints[0].firstAttribute, NSLayoutAttribute.Top, "Should be top")
        XCTAssertEqual(constraints[1].firstAttribute, NSLayoutAttribute.Bottom, "Should be bottom")
        
        XCTAssertEqual(constraints[0].secondAttribute, NSLayoutAttribute.Top, "Should be top")
        XCTAssertEqual(constraints[1].secondAttribute, NSLayoutAttribute.Bottom, "Should be bottom")
        
        XCTAssertEqual(constraints[0].firstItem as? View, view, "Should be added subview")
        XCTAssertEqual(constraints[1].firstItem as? View, view, "Should be added subview")
        
        XCTAssertEqual(constraints[0].secondItem as? View, container, "Should be containerView")
        XCTAssertEqual(constraints[1].secondItem as? View, container, "Should be containerView")
        
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[1].constant, -10, "Should be 10")
    }

    func testNativeConstraints() {
        let view = View()
        
        container.addSubview(view)
        
        var topNativeConstraints: [LayoutConstraint]!
        var topNativeConstraint: LayoutConstraint?
        var sizeNativeConstraints: [LayoutConstraint]!
        view.snp_makeConstraints { (make) -> Void in
            let topConstraint = make.top.equalToSuperview().inset(10).constraint
            topNativeConstraints = topConstraint.layoutConstraints
            topNativeConstraint = topConstraint.layoutConstraints.first
            let sizeConstraints = make.size.equalTo(50).constraint
            sizeNativeConstraints = sizeConstraints.layoutConstraints
        }

        XCTAssertEqual(topNativeConstraints.count, 1, "make.top should creates one native constraint")
        XCTAssertEqual(topNativeConstraint?.constant, 10, "topNativeConstraint.constant is set to 10")
        XCTAssertEqual(sizeNativeConstraints.count, 2, "make.tosize should create two native constraint")
        XCTAssertEqual(sizeNativeConstraints[0].constant, 50, "sizeNativeConstraints should set size[0] to 50")
        XCTAssertEqual(sizeNativeConstraints[1].constant, 50, "sizeNativeConstraints should set size[1] to 50")
    }
}
