//
//  ClimaUITests.swift
//  ClimaUITests
//
//  Created by Alexandra Tarasova on 1/3/22.
//

import XCTest

class ClimaUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let scenewindowWindow = app/*@START_MENU_TOKEN@*/.windows["SceneWindow"]/*[[".windows[\"Clima\"]",".windows[\"SceneWindow\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        let searchTextField = scenewindowWindow.textFields["Search"]
        _=searchTextField.waitForExistence(timeout: 5)
        searchTextField.click()
        searchTextField.typeText("Cupertino")
        scenewindowWindow.buttons["magnifyingglass"].click()
        
        sleep(3)
        
        let city = scenewindowWindow.staticTexts.element(boundBy: 1).label
        print("City is: \(city)")
        
        XCTAssertEqual(city,"Cupertino", "Error in the city")
        
    }
}
