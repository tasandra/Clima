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
        mainScreen.search(text: "Los Gatos")
        let city = mainScreen.getCityText()

        XCTAssertEqual(city, "Los Gatos", "Failed to search for Los Gatos weather")        
    }
    
}
