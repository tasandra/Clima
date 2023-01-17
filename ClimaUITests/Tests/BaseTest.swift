//
//  BaseTest.swift
//  ClimaUITests
//
//  Created by Alexandra Tarasova on 1/15/23.
//

import XCTest


class BaseTest: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }
    
//    override func tearDownWithError() throws {
//        app.terminate()
//    }
    
}
