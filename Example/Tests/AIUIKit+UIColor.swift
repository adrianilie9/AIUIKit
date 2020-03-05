import XCTest

@testable import AIUIKit

class AIUIKit_UIColor: XCTestCase {
    func testBack() {
        let blackColor = UIColor(hex: "000000")
        XCTAssertTrue(blackColor.rgba.red == 0.0)
        XCTAssertTrue(blackColor.rgba.green == 0.0)
        XCTAssertTrue(blackColor.rgba.blue == 0.0)
        XCTAssertTrue(blackColor.rgba.alpha == 1.0)
        
        let blackAlphaColor = UIColor(hex: "000000", alpha: 0.5)
        XCTAssertTrue(blackAlphaColor.rgba.red == 0.0)
        XCTAssertTrue(blackAlphaColor.rgba.green == 0.0)
        XCTAssertTrue(blackAlphaColor.rgba.blue == 0.0)
        XCTAssertTrue(blackAlphaColor.rgba.alpha == 0.5)
    }
    
    func testWhite() {
        let whiteColor = UIColor(hex: "FFFFFF")
        XCTAssertTrue(whiteColor.rgba.red == 1.0)
        XCTAssertTrue(whiteColor.rgba.green == 1.0)
        XCTAssertTrue(whiteColor.rgba.blue == 1.0)
        XCTAssertTrue(whiteColor.rgba.alpha == 1.0)
        
        let whiteAlphaColor = UIColor(hex: "FFFFFF", alpha: 0.5)
        XCTAssertTrue(whiteAlphaColor.rgba.red == 1.0)
        XCTAssertTrue(whiteAlphaColor.rgba.green == 1.0)
        XCTAssertTrue(whiteAlphaColor.rgba.blue == 1.0)
        XCTAssertTrue(whiteAlphaColor.rgba.alpha == 0.5)
    }
}
