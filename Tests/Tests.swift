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
    
}
