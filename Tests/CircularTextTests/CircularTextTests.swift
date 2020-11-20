import XCTest
@testable import CircularText

final class CircularTextTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CircularText().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
