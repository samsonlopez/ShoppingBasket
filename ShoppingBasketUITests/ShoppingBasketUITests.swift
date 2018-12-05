//
//  ShoppingBasketUITests.swift
//  ShoppingBasketUITests
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import XCTest

class ShoppingBasketUITests: XCTestCase {

    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
   }

    override func tearDown() {
    }

    func testAddItem_AddedSuccessfully() {
        
        let app = XCUIApplication()
        app.tables.cells["Sugar : per 1kg, €2.00"].buttons["Add"].tap()
        app.navigationBars["Shop"].buttons["Basket"].tap()
        
        let isRemoveExists = app.tables.cells["Sugar : per 1kg, €2.00"].buttons["Remove"].exists
        XCTAssertTrue(isRemoveExists, "Item not added to basket list")

    }

    func testRemoveItem_RemovedSuccessfully() {
        
        let app = XCUIApplication()
        app.tables.cells["Sugar : per 1kg, €2.00"].buttons["Add"].tap()
        app.navigationBars["Shop"].buttons["Basket"].tap()
        
        app.tables.cells["Sugar : per 1kg, €2.00"].buttons["Remove"].tap()
        let isCellExists = app.tables.cells["Sugar : per 1kg, €2.00"].exists

        XCTAssertFalse(isCellExists, "Item not removed from basket list")
    }
    
    func testCheckoutTotal_CorrectTotalValue() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.cells["Coffee : per 240g, €2.30"].buttons["Add"].tap()
        tablesQuery.cells["Tea : per box of 60, €3.10"].buttons["Add"].tap()
        app.navigationBars["Shop"].buttons["Basket"].tap()
        app.navigationBars["Basket"].buttons["Checkout"].tap()

        let isCellExists = app.tables.cells["Total, €5.40"].exists
        XCTAssertTrue(isCellExists, "Checkout total incorrect value")
    }
    
    func testCurrencyChange_CorrectRateAndTotalValues() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.cells["Coffee : per 240g, €2.30"].buttons["Add"].tap()
        tablesQuery.cells["Tea : per box of 60, €3.10"].buttons["Add"].tap()
        app.navigationBars["Shop"].buttons["Basket"].tap()
        app.navigationBars["Basket"].buttons["Checkout"].tap()
        
        let tablesQuery2 = tablesQuery
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["EUR"]/*[[".cells[\"Currency, EUR\"].staticTexts[\"EUR\"]",".staticTexts[\"EUR\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["CAD"]/*[[".cells[\"CAD, 0.0\"].staticTexts[\"CAD\"]",".staticTexts[\"CAD\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        // TODO: Appropriate XCTAsset statements.
    }
}
