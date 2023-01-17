//
//  ClimaUITests.swift
//  ClimaUITests
//
//  Created by Alexandra Tarasova on 1/3/22.
//

import XCTest

class ClimaUITests: BaseTest {
    
    let app = XCUIApplication()

    func testDefaultScreen() throws {
        let mainScreen = MainScreen()
        let city = mainScreen.getCityText()
        
        XCTAssertEqual(city, "London", "Error in Default City name")
    }
    
    func testDeviceLocation() throws {
        let mainScreen = MainScreen()
        mainScreen.getDeviceLocationWeather()
        let city = mainScreen.getCityText()

        XCTAssertEqual(city, "Cupertino", "Error in Device City name")
    }
    
    func testSearchCity() throws {
        let mainScreen = MainScreen()
        mainScreen.search(text: "Rome")
        let city = mainScreen.getCityText()

        XCTAssertEqual(city, "Rome", "Failed to search for Rome weather")
    }
    
    func testSearchCityTwoWords() throws {
        let mainScreen = MainScreen()
        mainScreen.search(text: "New York")
        let city = mainScreen.getCityText()

        XCTAssertEqual(city, "New York", "Failed to search for New York weather")
    }
    
    func testSearchCityAndCountry() throws {
        let mainScreen = MainScreen()
        mainScreen.search(text: "Odessa, US")
        let city = mainScreen.getCityText()

        XCTAssertEqual(city, "Odessa", "Failed to search for Odessa, US weather")
    }
    
    func testSearchEmptyField() throws {
        let mainScreen = MainScreen()
        mainScreen.search(text: "")
        let placeholderValue = mainScreen.getSearchPlaceholderValue()
        
        XCTAssertNotNil(placeholderValue.range(of:"Type something"))
    }
    
}

