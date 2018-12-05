//
//  CheckoutViewModelTests.swift
//  ShoppingBasketTests
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import XCTest
@testable import ShoppingBasket

class CheckoutViewModelTests: XCTestCase {

    var viewModelUnderTest: CheckoutViewModel!
    
    override func setUp() {
        viewModelUnderTest = CheckoutViewModel()
    }

    override func tearDown() {
        viewModelUnderTest = nil
    }

    func testGetExchangeTotal_CorrectTotalCalculated() {
        let exchangeTotal = viewModelUnderTest.getExchangeTotal(total: 234.56, rate: 2.65)
        // NOTE: This only for demonstrating testing business logic, as this calulation is very simple to test.
        let expectedTotal = 234.56 * 2.65 // This should not be computed like here, it should ideally be a hard coded value to compare.
        XCTAssertEqual(exchangeTotal, expectedTotal, "Exchange total calculation incorrect")
    }
}
