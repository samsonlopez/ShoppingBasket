//
//  BasketViewModel.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import Foundation

class BasketViewModel {
    
    var shoppingBasket = ShoppingBasket()
    
    func addItem(_ basketItem: BasketItem, itemID: Int) {
        _ = shoppingBasket.addItem(basketItem)
    }
    
    func getBasketItemViewData(at index: Int) -> BasketItemViewData {
        let basketItem = shoppingBasket.getItem(at: index)! // TODO: Eliminate force unwrap.
        let shopItem = basketItem.shopItem
        let shopItemViewData = BasketItemViewData(name: shopItem.name, quantity: 1, price: shopItem.price, description: shopItem.description)
        
        return shopItemViewData
    }

    func removeFromBasket(itemIndex: Int) {
        shoppingBasket.removeItem(at: itemIndex)
    }
    
    func getTotal() -> Double {
        return shoppingBasket.getTotal()
    }

}
