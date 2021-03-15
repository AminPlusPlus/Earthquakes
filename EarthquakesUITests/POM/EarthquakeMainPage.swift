//
//  EarthquakeMainPage.swift
//  EarthquakesUITests
//
//  Created by Aminjoni Abdullozoda on 3/14/21.
//

import UIKit
import XCTest
@testable import Earthquakes

class EarthquakeMainPage {
   
    fileprivate var app  : XCUIApplication!
    
    //MARK: Elements
    
    private var navitationTitle : XCUIElement { return app.navigationBars["Earthquakes"]}
    private var navigationReloadButton : XCUIElement { return app.buttons.element(matching: .button, identifier: AccessibilityIdentifiers.AXEarthquakeMainView.ReloadButton)}
    private var tableView : XCUIElement {return app.tables.element(matching: .table, identifier: AccessibilityIdentifiers.AXEarthquakeMainView.EarthquakeTableView)}
    private func tableViewCellTitle (by bound : Int = 0)  ->  XCUIElement {return app.cells.element(boundBy: bound).staticTexts.element(matching: .any, identifier: AccessibilityIdentifiers.AXEarthquakeTableCell.title)}
    private func tableViewCellSubTitle (by bound : Int = 0)  ->  XCUIElement {return app.cells.element(boundBy: bound).staticTexts.element(matching: .any, identifier: AccessibilityIdentifiers.AXEarthquakeTableCell.subTitle)}
    
    
    
    //MARK: Actions
    
    init(app : XCUIApplication) {
        self.app = app
    }
    
    ///Tap Reload Button
    func tapReloadButton() -> EarthquakeMainPage {
        _ = navigationReloadButton.waitForExistence(timeout: 2)
        navigationReloadButton.tap()
        return self
    }
    
    func swipeUpTableView() -> EarthquakeMainPage {
        _ = tableView.waitForExistence(timeout: 2)
        tableView.swipeUp()
        return self
    }
    
    func swipeDownTableView() -> EarthquakeMainPage {
        _ = tableView.waitForExistence(timeout: 2)
        tableView.swipeDown()
        return self
    }
    
    func tapTableViewCell(by index : Int) -> EarthquakeMainPage {
        _ = tableView.cells.element(boundBy: index).waitForExistence(timeout: 2)
        tableView.cells.element(boundBy: index).tap()
        return self
    }
    
    //MARK: Asserts
    
    func assertNavigationBarExist(isExist : Bool = true) -> EarthquakeMainPage {
        XCTAssertEqual(navitationTitle.exists, isExist)
        return self
    }
    func assertNavigationReloadButtonExist(isExist : Bool = true) -> EarthquakeMainPage {
        XCTAssertEqual(navigationReloadButton.exists, isExist)
        return self
    }
    func assertTableViewExist (isExist : Bool = true) -> EarthquakeMainPage {
        XCTAssertEqual(tableView.exists, isExist)
        return self
    }
    func assertTableViewCellExist(index : Int = 0) -> EarthquakeMainPage {
        _ = tableView.cells.element(boundBy: index).waitForExistence(timeout: 2)
        XCTAssertTrue(tableView.cells.element(boundBy: index).exists)
        return self
    }
    
    func assertTableViewCellTitleExist(isExist : Bool = true, by bound : Int) -> EarthquakeMainPage {
        _ = tableViewCellTitle(by: bound).waitForExistence(timeout: 2)
        XCTAssertEqual(tableViewCellTitle(by: bound).exists, isExist)
        return self
    }
    
    func assertTableViewCellSubTitleExist(isExist : Bool = true, by bound : Int) -> EarthquakeMainPage {
        _ = tableViewCellSubTitle(by: bound).waitForExistence(timeout: 2)
        XCTAssertEqual(tableViewCellSubTitle(by: bound).exists, isExist)
        return self
    }
}
