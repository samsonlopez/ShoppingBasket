//
//  BasketItem.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import Foundation

// Item with reference to ShopItem added to the shopping basket.
// Implementation for Equatable protocol used in unit testing.
struct BasketItem: Equatable {
    var shopItem: ShopItem
    var quantity: Int
    
    static func == (lhs: BasketItem, rhs: BasketItem) -> Bool {
        if lhs.shopItem == rhs.shopItem && lhs.quantity == rhs.quantity {
            return true
        }
        return false
    }

}
