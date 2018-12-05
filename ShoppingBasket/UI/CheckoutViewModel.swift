//
//  CheckoutViewModel.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import Foundation

class CheckoutViewModel {
    
    // Initialize currency code and rate with default values.
    var currencyCode: String = Global.defaultBaseCurrency
    var currencyRate: Double? = 1.0
 
    func getExchangeTotal(total: Double, rate: Double) -> Double {
        return total * rate
    }
}
