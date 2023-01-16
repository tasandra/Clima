//
//  MainScreen.swift
//  ClimaUITests
//
//  Created by Alexandra Tarasova on 1/15/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import XCTest


class MainScreen: BaseScreen, SearchProtocol{
    private let cityText: XCUIElement = app/*@START_MENU_TOKEN@*/.staticTexts["city"]/*[[".staticTexts[\"Cupertino\"]",".staticTexts[\"city\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    private let locationButton: XCUIElement = app.buttons["location"]
    
    override init() {
        super.init()
        visible()
    }
    
//    required init() {
//        super.init()
//        handleLocationAlertIfNeeded()
//    }
//
//    func handleLocationAlertIfNeeded() {
//        if isLocationAlertVisible() {
//            allowWhileUsingAppAlert.tap()
//        }
//    }
//
//    func isLocationAlertVisible() -> Bool {
//        return allowWhileUsingAppAlert.waitForExistence(timeout: 2)
//    }
    
    public func getCityText() -> String {
        guard  cityText.waitForExistence(timeout: visibleTimeout) else {
            return "Failed to find City text"
        }
        return cityText.label
    }
    
    public func getDeviceLocationWeather() {
        guard locationButton.waitForExistence(timeout: visibleTimeout) else {
            XCTFail("\(locationButton.description) is not visible")
            return
        }
        locationButton.tap()
    }
}

