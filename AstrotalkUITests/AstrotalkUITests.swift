//
//  AstrotalkUITests.swift
//  AstrotalkUITests
//
//  Created by Mac on 12/04/2024.
//

import XCTest

final class AstrotalkUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let googleSignInButton = app.buttons["Login with Google"]
        XCTAssertTrue(googleSignInButton.exists)
        googleSignInButton.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
