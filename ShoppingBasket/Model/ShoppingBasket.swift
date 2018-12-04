//
//  ShoppingBasket.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import Foundation

// Contains basket items which refer to shop items
class ShoppingBasket {
    
    // Holds basket items in added order.
    var basketItems = [BasketItem]()
    
    // Hashtable (dictonary) to search basket with itemID.
    var basketItemsLookup = [Int: BasketItem]()
    
    var count: Int {
        get {
            return basketItems.count
        }
    }
    
    func getItem(at index:Int) -> BasketItem? {
        return basketItems[index]
    }
    
    func addItem(_ basketItem: BasketItem) -> Bool {
        
        let itemID = basketItem.shopItem.id
        if !isItemExists(itemID) {
            basketItems.append(basketItem)
            basketItemsLookup[itemID] = basketItem
            print(basketItems.count)
            return true
        }
        return false
    }

    func removeItem(at index:Int) {
        let basketItem = basketItems[index]
        basketItemsLookup.removeValue(forKey: basketItem.shopItem.id)
        basketItems.remove(at: index)
    }

    func isItemExists(_ itemID: Int) -> Bool {
        let basketItem = basketItemsLookup[itemID]
        if(basketItem != nil) {
            return true
        }
        return false
    }
}


