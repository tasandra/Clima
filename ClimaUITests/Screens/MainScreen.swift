//
//  MainScreen.swift
//  ClimaUITests
//
//  Created by Alexandra Tarasova on 1/15/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import XCTest


class MainScreen: BaseScreen, SearchProtocol{
    private lazy var cityText: XCUIElement = BaseScreen.app.staticTexts["city"]
    private lazy var locationButton: XCUIElement = BaseScreen.app.buttons["location"]
    private lazy var searchField: XCUIElement = BaseScreen.app.textFields["searchField"]
    
    
    override init() {
        super.init()
        handleLocationAlertIfNeeded()
        visible()
    }
    
    
    
    public func getCityText() -> String {
        guard  cityText.waitForExistence(timeout: visibleTimeout) else {
            return "Failed to find City text"
        }
        return cityText.label
    }
    
    @discardableResult
    public func getDeviceLocationWeather() -> Self {
        tap(locationButton)
        return self
    }
    
    public func getSearchPlaceholderValue() -> String {
        guard searchField.waitForExistence(timeout: visibleTimeout) else {
            return "Failed to find search field"
        }
        return searchField.placeholderValue ?? ""
    }
}

