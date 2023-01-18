//
//  MainScreen.swift
//  ClimaUITests
//
//  Created by Alexandra Tarasova on 1/15/23.
//

import XCTest


class MainScreen: BaseScreen {
    private lazy var cityText: XCUIElement = BaseScreen.app.staticTexts["city"]
    private lazy var locationButton: XCUIElement = BaseScreen.app.buttons["location"]
    private lazy var searchField: XCUIElement = BaseScreen.app.textFields["searchField"]
    private lazy var searchButton = BaseScreen.app.buttons["search"]
    
    
    override init() {
        super.init()
        handleLocationAlertIfNeeded()
        visible()
    }
    
    public func getCityText() -> String {
        var city = ""
        if isElementPresent(cityText) {
            city = cityText.label
        }
        return city
    }
    
    @discardableResult
    public func getDeviceLocationWeather() -> Self {
        tap(locationButton)
        return self
    }
    
    @discardableResult
    public func search() -> Self {
        tap(searchButton)
        return self
    }
    
    @discardableResult
    public func typeInSearchFiled(text: String) -> Self {
        if isElementPresent(searchField){
            type(text, element: searchField)
        }
        return self
    }
    
    
    public func getSearchPlaceholderValue() -> String {
        var searchFiledPlaceHoldText = ""
        if isElementPresent(searchField){
            searchFiledPlaceHoldText = searchField.placeholderValue ?? ""
        }
        return searchFiledPlaceHoldText
    }
}

