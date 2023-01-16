//
//  BaseScreen.swift
//  ClimaUITests
//
//  Created by Alexandra Tarasova on 1/15/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import XCTest


class BaseScreen {
    static let app = XCUIApplication()
    let visibleTimeout: TimeInterval = 3.0
    
    func visible() {
        guard BaseScreen.app.wait(for: .runningForeground, timeout: visibleTimeout) else {
            XCTFail("Failed to launch app")
            return
        }
    }
//    static let springboard: XCUIApplication = .init(bundleIdentifier: "com.apple.springboard")
//    
//    private let allowWhileUsingAppAlert = springboard.alerts.firstMatch.buttons["Allow While Using App"]
}
