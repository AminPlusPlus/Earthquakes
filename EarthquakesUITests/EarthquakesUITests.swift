//
//  EarthquakesUITests.swift
//  EarthquakesUITests
//
//  Created by Aminjoni Abdullozoda on 3/12/21.
//

import XCTest

class EarthquakesUITests: XCTestCase {
    
    let app  = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testVerifyNavigationBarReloadButtonExist() throws {
        
        _ = EarthquakeMainPage(app: app)
            .assertNavigationBarExist()
            .assertNavigationReloadButtonExist()
            .tapReloadButton()
            .assertTableViewExist()
            .swipeUpTableView()
            .tapReloadButton()
            .assertTableViewCellExist()
            .assertTableViewCellTitleExist(by: 0)
            .assertTableViewCellSubTitleExist(by: 0)
            .tapTableViewCell(by: 0)
    }

}
