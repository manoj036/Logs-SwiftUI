//
//  LogsUITests.swift
//  LogsUITests
//
//  Created by manoj.gubba on 2020/09/13.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import XCTest

class LogsUITests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCanAddNewBook() {
        let app = XCUIApplication()
        app.launch()
        app.addInfo("add note")
    }

    func testCanAddNewNoteAndGoBack() {
        let app = XCUIApplication()

        app.launch()
        app.addInfo("add note")

        XCUIApplication().tables.children(matching: .cell).matching(identifier: "add note").element(boundBy: 0).buttons["add note"].tap()

        app.addInfo("add entry")
        app.navigationBars["add note"].buttons["Pages"].tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension XCUIApplication {
    var fabAdd: String { "fab_add" }
    var entryTFIdentifier: String { "textfield_entry" }

    func addInfo(_ string: String) {
        buttons[fabAdd].tap()
        let entryTextField = tables.textFields[entryTFIdentifier]
        entryTextField.tap()
        entryTextField.typeText(string + "\n")
    }
}
