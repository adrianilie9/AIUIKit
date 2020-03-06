import XCTest

@testable import AIUIKit

class AIUIKit_CGSize: XCTestCase {
    func testResize() {
        let size1 = CGSize(width: 320.0, height: 640.0)
        let resize1 = size1.resize(toMaximumSize: CGSize(width: 125.0, height: 300.0))
        XCTAssert(resize1.width == 125.0)
        XCTAssert(resize1.height == 250.0)
        
        let resize2 = size1.resize(toMaximumSize: CGSize(width: 400.0, height: 350.0))
        XCTAssert(resize2.width == 175.0)
        XCTAssert(resize2.height == 350.0)
        
        let resize3 = size1.resize(toMaximumSize: CGSize(width: 40.0, height: 80.0))
        XCTAssert(resize3.width == 40.0)
        XCTAssert(resize3.height == 80.0)
    }
}
