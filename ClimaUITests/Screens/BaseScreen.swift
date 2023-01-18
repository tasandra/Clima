//
//  BaseScreen.swift
//  ClimaUITests
//
//  Created by Alexandra Tarasova on 1/15/23.
//

import XCTest


class BaseScreen {
    static let app = XCUIApplication()
    let visibleTimeout: TimeInterval = 3.0
    static let springboard: XCUIApplication = .init(bundleIdentifier: "com.apple.springboard")
    private let allowWhileUsingAppAlert = springboard.alerts.firstMatch.buttons["Allow While Using App"]
    
    func handleLocationAlertIfNeeded() {
        if isLocationAlertVisible() {
            allowWhileUsingAppAlert.tap()
        }
    }

    func isLocationAlertVisible() -> Bool {
        return allowWhileUsingAppAlert.waitForExistence(timeout: 3)
    }
    
    func visible() {
        guard BaseScreen.app.wait(for: .runningForeground, timeout: visibleTimeout) else {
            XCTFail("Failed to launch app")
            return
        }
    }
    
    public func isElementPresent(_ element: XCUIElement) -> Bool {
        if !element.waitForExistence(timeout: visibleTimeout) {
            XCTFail("Failed to find City text")
            return false
        }
        return true
    }
    
    func tap(_ element: XCUIElement) {
        guard element.waitForExistence(timeout: visibleTimeout) else {
            XCTFail("\(element.description) is not visible")
            return
        }
        element.tap()
    }
    
    func type(_ text: String, element: XCUIElement) {
        guard element.waitForExistence(timeout: visibleTimeout) else {
            XCTFail("\(element.description) is not visible")
            return
        }
        element.tap()
        element.typeText(text)
    }
}

