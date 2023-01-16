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
    func search(text: String) -> MainScreen{
        let searchField = MainScreen.app.textFields["searchField"]
        searchField.tap()
        searchField.typeText(text)
        let searchButton = MainScreen.app.buttons["search"]
        searchButton.tap()
        return MainScreen.init()
    }
}
