//
//  ShopItem.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import Foundation

// Shop item which can be added to shopping basket
struct ShopItem: Equatable {
    var id: Int
    var name: String
    var price: Double
    var description: String
}
