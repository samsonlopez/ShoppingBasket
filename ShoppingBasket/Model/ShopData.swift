//
//  ShopData.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 04/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import Foundation

class ShopData {
    
    // Load shop data into shopItems array.
    static func loadShopData(shopItems: inout [ShopItem]) {
        shopItems.append(ShopItem(id: 1, name: "Coffee", price: 2.30, description:"per 240g"))
        shopItems.append(ShopItem(id: 2, name: "Tea", price: 3.10, description:"per box of 60"))
        shopItems.append(ShopItem(id: 3, name: "Sugar", price: 2.00, description:"per 1kg"))
        shopItems.append(ShopItem(id: 4, name: "Milk", price: 1.20, description:"per bottle"))
        shopItems.append(ShopItem(id: 5, name: "Cup", price: 0.50, description:""))
    }
}
