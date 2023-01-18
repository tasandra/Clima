//
//  ClimaUITests.swift
//  ClimaUITests
//
//  Created by Alexandra Tarasova on 1/3/22.
//

import XCTest

class ClimaUITests: BaseTest {
    
//    let app = XCUIApplication()

    func testDefaultScreen() throws {
        let mainScreen = MainScreen()
        let city = mainScreen.getCityText()
        
        XCTAssertEqual(city, "London", "Error in Default City name")
    }
    
    func testDeviceLocation() throws {
        let mainScreen = MainScreen()
        XCTContext.runActivity(named: "Tapping on Location Button") { _ in
            mainScreen.getDeviceLocationWeather()
        }
        let city = mainScreen.getCityText()

        XCTAssertEqual(city, "Cupertino", "Error in Device City name")
    }
    
    func testSearchCity() throws {
        let mainScreen = MainScreen()
        let expected_city = "Rome"
        mainScreen
            .typeInSearchFiled(text: expected_city)
            .search()
        let actual_city = mainScreen.getCityText()

        XCTAssertEqual(expected_city, actual_city, "Failed to search for \(expected_city) weather")
    }
    
    func testSearchCityTwoWords() throws {
        let mainScreen = MainScreen()
        let expected_city = "New York"
        mainScreen
            .typeInSearchFiled(text: expected_city)
            .search()
        let actual_city = mainScreen.getCityText()

        XCTAssertEqual(expected_city, actual_city, "Failed to search for \(expected_city) weather")
    }
    
    func testSearchCityAndCountry() throws {
        let mainScreen = MainScreen()
        let city = "Odessa, US"
        let expected_city = "Odessa"
        mainScreen
            .typeInSearchFiled(text: city)
            .search()
        let actual_city = mainScreen.getCityText()

        XCTAssertEqual(expected_city, actual_city, "Failed to search for \(expected_city) weather")
    }
    
    func testSearchEmptyField() throws {
        let mainScreen = MainScreen()
        let expected_city = ""
        XCTContext.runActivity(named: "Leaving search field empty") { _ in
            mainScreen
                .typeInSearchFiled(text: expected_city)
                .search()
        }
        let placeholderValue = mainScreen.getSearchPlaceholderValue()
        
        XCTContext.runActivity(named: "Attach the screenshort of the empty search field") { activity in
            let screen = XCUIScreen.main
            let fullScreenshot = screen.screenshot()
            let fullScreenshotAttachment = XCTAttachment(screenshot: fullScreenshot)
            fullScreenshotAttachment.lifetime = .keepAlways
            activity.add(fullScreenshotAttachment)
        }
        
        XCTAssertNotNil(placeholderValue.range(of:"Type something"))
    }
    
}

