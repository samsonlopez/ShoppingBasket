//
//  Currency.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import Foundation

// Domain model for currency to decode currency rates in JSON data from currency data service.
struct Currency: Codable {
    var base: String
    var date: String
    var rates: [String: Double]
}
