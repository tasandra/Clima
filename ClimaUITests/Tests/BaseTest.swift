//
//  BaseTest.swift
//  ClimaUITests
//
//  Created by Alexandra Tarasova on 1/15/23.
//

import XCTest


class BaseTest: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
//        deleteApp()
    }
    
    func deleteApp() {
        app.terminate()
        let icon = BaseScreen.springboard.icons["Clima"]
        icon.press(forDuration: 1.3)
        let removeAppButton = BaseScreen.springboard.buttons["Remove App"]
        removeAppButton.tap()
        let deleteAppButton = BaseScreen.springboard.buttons["Delete App"]
        deleteAppButton.tap()
        let deleteButton = BaseScreen.springboard.buttons["Delete"]
        deleteButton.tap()
    }
    
}
