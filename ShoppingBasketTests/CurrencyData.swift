//
//  TestData.swift
//  ShoppingBasketTests
//
//  Created by Samson Lopez on 04/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import Foundation
@testable import ShoppingBasket

// Provides currency data from a static JSON file for creating initial list of currencies.
// Also used for testing data service and viewModels which use data service.

class CurrencyData {
    static func getTestData() -> Data {
        let path = Bundle.main.path(forResource: "testdata", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        return data
    }
    
    static func getTestCurrency() -> Currency? {
        var currency: Currency?
        
        let testData = CurrencyData.getTestData()
        do {
            let decoder = JSONDecoder()
            currency = try decoder.decode(Currency.self, from: testData)
        } catch let error {
            print(error)
        }
        
        return currency
    }
}
