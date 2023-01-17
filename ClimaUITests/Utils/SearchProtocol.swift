//
//  SearchProtocol.swift
//  ClimaUITests
//
//  Created by Alexandra Tarasova on 1/15/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation


protocol SearchProtocol {
    @discardableResult
    func search(text: String) -> MainScreen
}

extension SearchProtocol {
    @discardableResult
    func search(text: String) -> MainScreen {
        let searchField = MainScreen.app.textFields["searchField"]
        let searchButton = MainScreen.app.buttons["search"]
        if searchField.waitForExistence(timeout: 2) && searchButton.waitForExistence(timeout: 2){
            searchField.tap()
            searchField.typeText(text)
            searchButton.tap()
        }else{
            print("Search field or Search button is not visible")
        }
        return MainScreen.init()
    }
}
