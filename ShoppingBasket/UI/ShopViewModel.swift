//
//  ShopViewModel.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import Foundation

class ShopViewModel {
    
    var shopItems = [ShopItem]()
    
    weak var basketViewModel: BasketViewModel?
    
    func loadShopItems() {
        
        // TODO: Shop item data to be loaded from a Data Source or Content Service.
        ShopData.loadShopData(shopItems: &shopItems)
        
        print (shopItems.count)
    }
    
    func getShopItemViewData(at index: Int) -> ShopItemViewData {
        let shopItem = shopItems[index]
        let shopItemViewData = ShopItemViewData(name: shopItem.name, price: shopItem.price, description: shopItem.description)
        
        return shopItemViewData
    }
    
    func addToBasket(itemIndex: Int) {
        let shopItem = shopItems[itemIndex]
        let basketItem = BasketItem(shopItem: shopItem, quantity: 1)
        basketViewModel?.addItem(basketItem, itemID: shopItem.id)
    }
}
