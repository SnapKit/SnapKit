#if canImport(UIKit)
import UIKit
typealias View = UIView
extension View {
    var snp_constraints: [AnyObject] {
        constraints
            .filter { $0 is LayoutConstraint }
            .filter { $0.isActive }
    }
}
#else
import AppKit
typealias View = NSView
extension View {
    var snp_constraints: [AnyObject] {
        constraints
            .filter { $0 is LayoutConstraint }
            .filter { $0.isActive }
    }
}
#endif

import XCTest
@testable import SnapKit

final class SnapKitTests: XCTestCase {
    
    let container = View()
    
    func testMakeConstraints() {
        let firstView = View()
        let secondView = View()
        container.addSubview(firstView)
        container.addSubview(secondView)
        
        firstView.snp.makeConstraints {
            $0.top.equalTo(secondView.snp.top).offset(50)
            $0.left.equalTo(secondView.snp.top).offset(50)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints installed")
        
        secondView.snp.makeConstraints {
            $0.edges.equalTo(firstView)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 6, "Should have 6 constraints installed")
    }

    func testHorizontalVerticalEdges() {
        let view = View()
        container.addSubview(view)

        view.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }

        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints installed")

        XCTAssertTrue(container.constraints.count == 4)
        XCTAssertTrue(container.constraints.allSatisfy { $0.firstItem === view && $0.secondItem === view.superview })
        XCTAssertNotNil(container.constraints.first { $0.firstAttribute == .left && $0.secondAttribute == .left })
        XCTAssertNotNil(container.constraints.first { $0.firstAttribute == .right && $0.secondAttribute == .right })
        XCTAssertNotNil(container.constraints.first { $0.firstAttribute == .top && $0.secondAttribute == .top })
        XCTAssertNotNil(container.constraints.first { $0.firstAttribute == .bottom && $0.secondAttribute == .bottom })
    }

    func testHorizontalVerticalDirectionalEdges() {
        let view = View()
        container.addSubview(view)

        view.snp.makeConstraints {
            $0.directionalVerticalEdges.equalToSuperview()
            $0.directionalHorizontalEdges.equalToSuperview()
        }

        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints installed")

        XCTAssertTrue(container.constraints.count == 4)
        XCTAssertTrue(container.constraints.allSatisfy { $0.firstItem === view && $0.secondItem === view.superview })
        XCTAssertNotNil(container.constraints.first { $0.firstAttribute == .leading && $0.secondAttribute == .leading })
        XCTAssertNotNil(container.constraints.first { $0.firstAttribute == .trailing && $0.secondAttribute == .trailing })
        XCTAssertNotNil(container.constraints.first { $0.firstAttribute == .top && $0.secondAttribute == .top })
        XCTAssertNotNil(container.constraints.first { $0.firstAttribute == .bottom && $0.secondAttribute == .bottom })
    }
    
    func testGuideMakeConstraints() {
        guard #available(iOS 9.0, OSX 10.11, *) else { return }
        let view = View()

        let сonstraintLayoutGuide = ConstraintLayoutGuide()
        container.addSubview(view)
        container.addLayoutGuide(сonstraintLayoutGuide)
            
        view.snp.makeConstraints {
            $0.top.equalTo(сonstraintLayoutGuide).offset(50)
            $0.left.equalTo(сonstraintLayoutGuide.snp.top).offset(50)
        }
            
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints installed")
        
        сonstraintLayoutGuide.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 6, "Should have 6 constraints installed")
    }
    
    func testMakeImpliedSuperviewConstraints() {
        let firstView = View()
        let secondView = View()
        container.addSubview(firstView)
        container.addSubview(secondView)
        
        firstView.snp.makeConstraints {
            $0.top.equalTo(50.0)
            $0.left.equalTo(50.0)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints installed")
        
        secondView.snp.makeConstraints {
            $0.edges.equalTo(firstView)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 6, "Should have 6 constraints installed")
    }
    
    func testUpdateConstraints() {
        let firstView = View()
        let secondView = View()
        container.addSubview(firstView)
        container.addSubview(secondView)
        
        firstView.snp.makeConstraints {
            $0.top.equalTo(secondView.snp.top).offset(50)
            $0.left.equalTo(secondView.snp.top).offset(50)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints installed")
        
        firstView.snp.updateConstraints {
            $0.top.equalTo(secondView.snp.top).offset(15)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should still have 2 constraints installed")
    }
    
    func testRemakeConstraints() {
        let firstView = View()
        let secondView = View()
        container.addSubview(firstView)
        container.addSubview(secondView)
        
        firstView.snp.makeConstraints {
            $0.top.equalTo(secondView.snp.top).offset(50)
            $0.left.equalTo(secondView.snp.top).offset(50)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints installed")
        
        firstView.snp.remakeConstraints {
            $0.edges.equalTo(secondView)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints installed")
    }
    
    func testRemoveConstraints() {
        let firstView = View()
        let secondView = View()
        container.addSubview(firstView)
        container.addSubview(secondView)
        
        firstView.snp.makeConstraints {
            $0.top.equalTo(secondView).offset(50)
            $0.left.equalTo(secondView).offset(50)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints installed")
        
        print(container.snp_constraints)
        
        firstView.snp.removeConstraints()
        
        print(container.snp_constraints)
        
        XCTAssertEqual(container.snp_constraints.count, 0, "Should have 0 constraints installed")
    }
    
    func testPrepareConstraints() {
        let firstView = View()
        let secondView = View()
        container.addSubview(firstView)
        container.addSubview(secondView)
        
        let constraints = firstView.snp.prepareConstraints {
            $0.edges.equalTo(secondView)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 0, "Should have 0 constraints installed")
        
        for constraint in constraints {
            constraint.activate()
        }
        
        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints installed")
        
        for constraint in constraints {
            constraint.deactivate()
        }
        
        XCTAssertEqual(container.snp_constraints.count, 0, "Should have 0 constraints installed")
    }
    
    func testReactivateConstraints() {
        let firstView = View()
        let secondView = View()
        container.addSubview(firstView)
        container.addSubview(secondView)
        
        let constraints = firstView.snp.prepareConstraints {
            $0.edges.equalTo(secondView)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 0, "Should have 0 constraints installed")
        
        for constraint in constraints {
            constraint.activate()
        }
        
        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints installed")
        
        for constraint in constraints {
            constraint.deactivate()
        }
        
        XCTAssertEqual(container.snp_constraints.count, 0, "Should have 0 constraints installed")
    }
    
    func testActivateDeactivateConstraints() {
        let firstView = View()
        let secondView = View()
        container.addSubview(firstView)
        container.addSubview(secondView)
        
        var topConstraint: Constraint? = nil
        var leftConstraint: Constraint? = nil
        
        firstView.snp.prepareConstraints {
            topConstraint = $0.top.equalTo(secondView.snp.top).offset(50).constraint
            leftConstraint = $0.left.equalTo(secondView.snp.top).offset(50).constraint
        }
        
        XCTAssertEqual(container.snp_constraints.count, 0, "Should have 0 constraints")
        
        topConstraint?.activate()
        leftConstraint?.activate()
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints")
        
        topConstraint?.deactivate()
        leftConstraint?.deactivate()
        
        XCTAssertEqual(container.snp_constraints.count, 0, "Should have 0 constraints")
        
        topConstraint?.activate()
        leftConstraint?.activate()
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints")
    }
    
    func testSetIsActivatedConstraints() {
        let firstView = View()
        let secondView = View()
        container.addSubview(firstView)
        container.addSubview(secondView)
        
        var topConstraint: Constraint? = nil
        var leftConstraint: Constraint? = nil
        
        firstView.snp.prepareConstraints {
            topConstraint = $0.top.equalTo(secondView.snp.top).offset(50).constraint
            leftConstraint = $0.left.equalTo(secondView.snp.top).offset(50).constraint
        }
        
        XCTAssertEqual(container.snp_constraints.count, 0, "Should have 0 constraints")
        
        topConstraint?.isActive = true
        leftConstraint?.isActive = false
        
        XCTAssertEqual(container.snp_constraints.count, 1, "Should have 1 constraint")
        
        topConstraint?.isActive = true
        leftConstraint?.isActive = true
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints")
        
        topConstraint?.isActive = false
        leftConstraint?.isActive = false
        
        XCTAssertEqual(container.snp_constraints.count, 0, "Should have 0 constraints")
    }
    
    func testEdgeConstraints() {
        let view = View()
        container.addSubview(view)
        
        view.snp.makeConstraints {
            $0.edges.equalTo(container).offset(50.0)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints")
        
        let constraints = container.snp_constraints as! [NSLayoutConstraint]
        
        XCTAssertEqual(constraints[0].constant, 50, "Should be 50")
        XCTAssertEqual(constraints[1].constant, 50, "Should be 50")
        XCTAssertEqual(constraints[2].constant, 50, "Should be 50")
        XCTAssertEqual(constraints[3].constant, 50, "Should be 50")
    }
    
    func testUpdateReferencedConstraints() {
        let firstView = View()
        let secondView = View()
        container.addSubview(firstView)
        container.addSubview(secondView)
        
        var topConstraint: Constraint! = nil
        var bottomConstraint: Constraint! = nil
        
        firstView.snp.makeConstraints {
            topConstraint = $0.top.equalTo(secondView).offset(50).constraint
            bottomConstraint = $0.bottom.equalTo(secondView).offset(25).constraint
        }
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints")
        
        let constraints = (container.snp_constraints as! [NSLayoutConstraint]).sorted { $0.constant > $1.constant }
        
        XCTAssertEqual(constraints[0].constant, 50, "Should be 50")
        XCTAssertEqual(constraints[1].constant, 25, "Should be 25")
        
        topConstraint.update(offset: 15)
        bottomConstraint.update(offset: 20)
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints")
        
        XCTAssertEqual(constraints[0].constant, 15, "Should be 15")
        XCTAssertEqual(constraints[1].constant, 20, "Should be 20")
        
        topConstraint.update(inset: 15)
        bottomConstraint.update(inset: 20)
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints")
        
        XCTAssertEqual(constraints[0].constant, 15, "Should be 15")
        XCTAssertEqual(constraints[1].constant, -20, "Should be -20")
    }
    
    func testInsetsAsConstraintsConstant() {
        let view = View()
        container.addSubview(view)
        
        view.snp.makeConstraints {
            $0.edges.equalTo(container).inset(50.0)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints")
        
        let constraints = (container.snp_constraints as! [NSLayoutConstraint]).sorted { $0.constant > $1.constant }
        
        XCTAssertEqual(constraints[0].constant, 50, "Should be 50")
        XCTAssertEqual(constraints[1].constant, 50, "Should be 50")
        XCTAssertEqual(constraints[2].constant, -50, "Should be -50")
        XCTAssertEqual(constraints[3].constant, -50, "Should be -50")
    }
    
    func testConstraintInsetsAsImpliedEqualToConstraints() {
        let view = View()
        container.addSubview(view)
        
        view.snp.makeConstraints {
            $0.edges.equalTo(ConstraintInsets(top: 25, left: 25, bottom: 25, right: 25))
        }
        
        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints")
        
        let constraints = (container.snp_constraints as! [NSLayoutConstraint]).sorted { $0.constant > $1.constant }
        
        XCTAssertEqual(constraints[0].constant, 25, "Should be 25")
        XCTAssertEqual(constraints[1].constant, 25, "Should be 25")
        XCTAssertEqual(constraints[2].constant, -25, "Should be -25")
        XCTAssertEqual(constraints[3].constant, -25, "Should be -25")
    }
    
    func testConstraintInsetsAsConstraintsConstant() {
        let view = View()
        container.addSubview(view)
        
        view.snp.makeConstraints {
            $0.edges.equalTo(container).inset(ConstraintInsets(top: 25, left: 25, bottom: 25, right: 25))
        }
        
        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints")
        
        let constraints = (container.snp_constraints as! [NSLayoutConstraint]).sorted { $0.constant > $1.constant }
        
        XCTAssertEqual(constraints[0].constant, 25, "Should be 25")
        XCTAssertEqual(constraints[1].constant, 25, "Should be 25")
        XCTAssertEqual(constraints[2].constant, -25, "Should be -25")
        XCTAssertEqual(constraints[3].constant, -25, "Should be -25")
    }
    
    #if canImport(UIKit)
    @available(iOS 11.0, tvOS 11.0, *)
    func testConstraintDirectionalInsetsAsImpliedEqualToConstraints() {
        let view = View()
        container.addSubview(view)

        view.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalTo(container).inset(ConstraintDirectionalInsets(top: 25, leading: 25, bottom: 25, trailing: 25))
        }

        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints")

        let constraints = (container.snp_constraints as! [NSLayoutConstraint]).sorted { $0.firstAttribute.rawValue < $1.firstAttribute.rawValue }

        let verify: (NSLayoutConstraint, NSLayoutConstraint.Attribute, CGFloat) -> Void = { constraint, attribute, constant in
            XCTAssertEqual(constraint.firstAttribute, attribute, "First attribute \(constraint.firstAttribute.rawValue) is not \(attribute.rawValue)")
            XCTAssertEqual(constraint.secondAttribute, attribute, "Second attribute \(constraint.secondAttribute.rawValue) is not \(attribute.rawValue)")
            XCTAssertEqual(constraint.constant, constant, "Attribute \(attribute.rawValue) should have constant \(constant)")
        }

        verify(constraints[0], .top, 25)
        verify(constraints[1], .bottom, -25)
        verify(constraints[2], .leading, 25)
        verify(constraints[3], .trailing, -25)
    }
    #endif

    #if canImport(UIKit)
    @available(iOS 11.0, tvOS 11.0, *)
    func testConstraintDirectionalInsetsAsConstraintsConstant() {
        let view = View()
        container.addSubview(view)

        view.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalTo(container).inset(ConstraintDirectionalInsets(top: 25, leading: 25, bottom: 25, trailing: 25))
        }

        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints")

        let constraints = (container.snp_constraints as! [NSLayoutConstraint]).sorted { $0.firstAttribute.rawValue < $1.firstAttribute.rawValue }

        let verify: (NSLayoutConstraint, NSLayoutConstraint.Attribute, CGFloat) -> Void = { constraint, attribute, constant in
            XCTAssertEqual(constraint.firstAttribute, attribute, "First attribute \(constraint.firstAttribute.rawValue) is not \(attribute.rawValue)")
            XCTAssertEqual(constraint.secondAttribute, attribute, "Second attribute \(constraint.secondAttribute.rawValue) is not \(attribute.rawValue)")
            XCTAssertEqual(constraint.constant, constant, "Attribute \(attribute.rawValue) should have constant \(constant)")
        }

        verify(constraints[0], .top, 25)
        verify(constraints[1], .bottom, -25)
        verify(constraints[2], .leading, 25)
        verify(constraints[3], .trailing, -25)
    }
    #endif

    #if canImport(UIKit)
    @available(iOS 11.0, tvOS 11.0, *)
    func testConstraintDirectionalInsetsFallBackForNonDirectionalConstraints() {
        let view = View()
        container.addSubview(view)

        view.snp.makeConstraints {
            $0.edges.equalTo(container).inset(ConstraintDirectionalInsets(top: 25, leading: 25, bottom: 25, trailing: 25))
        }

        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints")

        let constraints = (container.snp_constraints as! [NSLayoutConstraint]).sorted { $0.firstAttribute.rawValue < $1.firstAttribute.rawValue }

        let verify: (NSLayoutConstraint, NSLayoutConstraint.Attribute, CGFloat) -> Void = { constraint, attribute, constant in
            XCTAssertEqual(constraint.firstAttribute, attribute, "First attribute \(constraint.firstAttribute.rawValue) is not \(attribute.rawValue)")
            XCTAssertEqual(constraint.secondAttribute, attribute, "Second attribute \(constraint.secondAttribute.rawValue) is not \(attribute.rawValue)")
            XCTAssertEqual(constraint.constant, constant, "Attribute \(attribute.rawValue) should have constant \(constant)")
        }

        verify(constraints[0], .left, 25)
        verify(constraints[1], .right, -25)
        verify(constraints[2], .top, 25)
        verify(constraints[3], .bottom, -25)
    }
    #endif

    func testSizeConstraints() {
        let view = View()
        container.addSubview(view)
        
        view.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 50, height: 50))
            $0.left.top.equalTo(container)
        }
        
        XCTAssertEqual(view.snp_constraints.count, 2, "Should have 2 constraints")
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints")
        
        let constraints = view.snp_constraints as! [NSLayoutConstraint]

        // no guarantee which order the constraints are in, but we should test their couple
        let widthHeight = (LayoutAttribute.width.rawValue, LayoutAttribute.height.rawValue)
        let heightWidth = (widthHeight.1, widthHeight.0)
        let firstSecond = (constraints[0].firstAttribute.rawValue, constraints[1].firstAttribute.rawValue)

        // constraint values are correct in either width, height or height, width order
        XCTAssertTrue(firstSecond == widthHeight || firstSecond == heightWidth, "2 contraint values should match")
        XCTAssertEqual(constraints[0].constant, 50, "Should be 50")
        XCTAssertEqual(constraints[1].constant, 50, "Should be 50")
    }
    
    func testCenterConstraints() {
        let view = View()
        container.addSubview(view)
        
        view.snp.makeConstraints {
            $0.center.equalTo(container).offset(50.0)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 2, "Should have 2 constraints")
        
        if let constraints = container.snp_constraints as? [NSLayoutConstraint], constraints.count > 0 {
            XCTAssertEqual(constraints[0].constant, 50, "Should be 50")
            XCTAssertEqual(constraints[1].constant, 50, "Should be 50")
        }
    }
    
    func testConstraintIdentifier() {
        let identifier = "Test-Identifier"
        let view = View()
        container.addSubview(view)
        
        view.snp.makeConstraints {
            $0.top.equalTo(container.snp.top).labeled(identifier)
        }
        
        let constraints = container.snp_constraints as! [NSLayoutConstraint]
        XCTAssertEqual(constraints[0].identifier, identifier, "Identifier should be 'Test'")
    }
    
    func testEdgesToEdges() {
        var fromAttributes = Set<LayoutAttribute>()
        var toAttributes = Set<LayoutAttribute>()
        
        let view = View()
        container.addSubview(view)
        
        view.snp.remakeConstraints {
            $0.edges.equalTo(container.snp.edges)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints")
        
        for constraint in (container.snp_constraints as! [NSLayoutConstraint]) {
            fromAttributes.insert(constraint.firstAttribute)
            toAttributes.insert(constraint.secondAttribute)
        }
        
        XCTAssert(fromAttributes == [.top, .left, .bottom, .right])
        XCTAssert(toAttributes == [.top, .left, .bottom, .right])
    }

    func testDirectionalEdgesToDirectionalEdges() {
        var fromAttributes = Set<LayoutAttribute>()
        var toAttributes = Set<LayoutAttribute>()
        
        let view = View()
        container.addSubview(view)
        
        view.snp.remakeConstraints {
            $0.directionalEdges.equalTo(container.snp.directionalEdges)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints")
        
        for constraint in (container.snp_constraints as! [NSLayoutConstraint]) {
            fromAttributes.insert(constraint.firstAttribute)
            toAttributes.insert(constraint.secondAttribute)
        }
        
        XCTAssert(fromAttributes == [.top, .leading, .bottom, .trailing])
        XCTAssert(toAttributes == [.top, .leading, .bottom, .trailing])
    }
    
    #if canImport(UIKit)
    func testEdgesToMargins() {
        var fromAttributes = Set<LayoutAttribute>()
        var toAttributes = Set<LayoutAttribute>()
        
        let view = View()
        container.addSubview(view)
        
        view.snp.remakeConstraints {
            $0.edges.equalTo(container.snp.margins)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints")
        
        for constraint in (container.snp_constraints as! [NSLayoutConstraint]) {
            fromAttributes.insert(constraint.firstAttribute)
            toAttributes.insert(constraint.secondAttribute)
        }
        
        XCTAssert(fromAttributes == [.top, .left, .bottom, .right])
        XCTAssert(toAttributes == [.topMargin, .leftMargin, .bottomMargin, .rightMargin])
        
        fromAttributes.removeAll()
        toAttributes.removeAll()
        
        view.snp.remakeConstraints {
            $0.margins.equalTo(container.snp.edges)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints")
        
        for constraint in (container.snp_constraints as! [NSLayoutConstraint]) {
            fromAttributes.insert(constraint.firstAttribute)
            toAttributes.insert(constraint.secondAttribute)
        }
        
        XCTAssert(toAttributes == [.top, .left, .bottom, .right])
        XCTAssert(fromAttributes == [.topMargin, .leftMargin, .bottomMargin, .rightMargin])
    }

    func testDirectionalEdgesToDirectionalMargins() {
        var fromAttributes = Set<LayoutAttribute>()
        var toAttributes = Set<LayoutAttribute>()
        
        let view = View()
        container.addSubview(view)
        
        view.snp.remakeConstraints {
            $0.directionalEdges.equalTo(container.snp.directionalMargins)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints")
        
        for constraint in (container.snp_constraints as! [NSLayoutConstraint]) {
            fromAttributes.insert(constraint.firstAttribute)
            toAttributes.insert(constraint.secondAttribute)
        }
        
        XCTAssert(fromAttributes == [.top, .leading, .bottom, .trailing])
        XCTAssert(toAttributes == [.topMargin, .leadingMargin, .bottomMargin, .trailingMargin])
        
        fromAttributes.removeAll()
        toAttributes.removeAll()
        
        view.snp.remakeConstraints {
            $0.directionalMargins.equalTo(container.snp.directionalEdges)
        }
        
        XCTAssertEqual(container.snp_constraints.count, 4, "Should have 4 constraints")
        
        for constraint in (container.snp_constraints as! [NSLayoutConstraint]) {
            fromAttributes.insert(constraint.firstAttribute)
            toAttributes.insert(constraint.secondAttribute)
        }
        
        XCTAssert(toAttributes == [.top, .leading, .bottom, .trailing])
        XCTAssert(fromAttributes == [.topMargin, .leadingMargin, .bottomMargin, .trailingMargin])
    }
    
    func testLayoutGuideConstraints() {
        let viewController = UIViewController()
        viewController.view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        
        viewController.view.addSubview(container)
        
        container.snp.makeConstraints {
            $0.top.equalTo(viewController.view.safeAreaLayoutGuide.snp.bottom)
            $0.bottom.equalTo(viewController.view.safeAreaLayoutGuide.snp.top)
        }
         
        XCTAssertEqual(viewController.view.snp_constraints.count, 2, "Should have 2 constraints installed")
    }
    #endif
    
    func testCanSetLabel() {
        container.snp.setLabel("Hello World")

        XCTAssertEqual(container.snp.label(), "Hello World")
    }
    
    func testPriorityShortcuts() {
        let view = View()
        container.addSubview(view)
        
        view.snp.remakeConstraints { make in
            make.left.equalTo(1000.0).priority(.required)
        }
        XCTAssertEqual(container.snp_constraints.count, 1, "Should have 1 constraint")
        XCTAssertEqual(container.snp_constraints.first?.priority, ConstraintPriority.required.value)
        
        view.snp.remakeConstraints { make in
            make.left.equalTo(1000.0).priority(.low)
        }
        XCTAssertEqual(container.snp_constraints.count, 1, "Should have 1 constraint")
        XCTAssertEqual(container.snp_constraints.first?.priority, ConstraintPriority.low.value)
        
        view.snp.remakeConstraints { make in
            make.left.equalTo(1000.0).priority(ConstraintPriority.low.value + 1)
        }
        XCTAssertEqual(container.snp_constraints.count, 1, "Should have 1 constraint")
        XCTAssertEqual(container.snp_constraints.first?.priority, ConstraintPriority.low.value + 1)
    }

    func testPriorityStride() {
        let highPriority: ConstraintPriority = .high
        let higherPriority: ConstraintPriority = ConstraintPriority.high.advanced(by: 1)
        XCTAssertEqual(higherPriority.value, highPriority.value + 1)
    }
}
