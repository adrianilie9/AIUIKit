import XCTest

@testable import AIUIKit

class AIUIKit_String: XCTestCase {
    func testHtmlFiltering() {
        XCTAssertTrue(
            "Test <strong>bold</strong> string.".htmlTagsFiltered() == "Test bold string."
        )
        
        XCTAssertTrue(
            "Test <script type=\"text/javascript\">var x = 21;</script> JavaScript.".htmlTagsFiltered() == "Test var x = 21; JavaScript."
        )
    }
    
    func testTrim() {
        XCTAssert(
            "The quick brown fox jumps over the lazy dog".trimToLength(length: 5) == "The q"
        )
        
        XCTAssert(
            "The quick brown fox jumps over the lazy dog".trimToLength(length: 10) == "The quick"
        )
    }
    
    func testVisible() {
        guard let font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0) else {
            XCTAssert(false, "Font \"AppleSDGothicNeo-Regular\" not available on test target.")
            return
        }
        
        XCTAssert(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis tortor sed risus scelerisque eleifend eu nec eros. Proin eu nunc finibus, dapibus justo sagittis, venenatis magna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam maximus nulla a purus fermentum tempus. Quisque aliquam sagittis odio et mattis. Aenean nec sollicitudin erat. In tempus justo lorem, a efficitur magna sollicitudin sed. Praesent ac placerat lectus. Nunc vel mauris fermentum, ullamcorper nibh sed, dictum tortor. Mauris ultricies pretium erat, et ultrices odio suscipit sit amet. Nulla eleifend augue id lacus vehicula iaculis. Sed lobortis tellus ac eros elementum, eget porta sem dictum. Vivamus aliquam a tortor eu euismod."
                .visible(inSize: CGSize(width: 320.0, height: 120.0), withFont: font)
            ==
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis tortor sed risus scelerisque eleifend eu nec eros. Proin eu nunc finibus, dapibus justo sagittis, venenatis magn"
        )
    }
    
    func testHeight() {
        guard let font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0) else {
            XCTAssert(false, "Font \"AppleSDGothicNeo-Regular\" not available on test target.")
            return
        }
        
        XCTAssert(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis tortor sed risus scelerisque eleifend eu nec eros. Proin eu nunc finibus, dapibus justo sagittis, venenatis magna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam maximus nulla a purus fermentum tempus. Quisque aliquam sagittis odio et mattis. Aenean nec sollicitudin erat. In tempus justo lorem, a efficitur magna sollicitudin sed. Praesent ac placerat lectus. Nunc vel mauris fermentum, ullamcorper nibh sed, dictum tortor. Mauris ultricies pretium erat, et ultrices odio suscipit sit amet. Nulla eleifend augue id lacus vehicula iaculis. Sed lobortis tellus ac eros elementum, eget porta sem dictum. Vivamus aliquam a tortor eu euismod."
                .requiredHeightToDisplay(forWidth: 320.0, withFont: font)
            ==
            CGFloat(552.0)
        )
    }
}
