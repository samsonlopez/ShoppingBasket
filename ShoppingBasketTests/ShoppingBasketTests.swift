//
//  ShoppingBasketTests.swift
//  ShoppingBasketTests
//
//  Created by Samson Lopez on 04/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import XCTest
@testable import ShoppingBasket

class ShoppingBasketTests: XCTestCase {

    var shopItems = [ShopItem]()
    let shoppingBasketUnderTest = ShoppingBasket()
    
    override func setUp() {
        
        // Load shop data
        ShopData.loadShopData(shopItems: &shopItems)
    }

    override func tearDown() {
    }

    func testAddItem_AddedSuccessfully() {
        let shopItem = shopItems[0]
        let basketItem = BasketItem(shopItem: shopItem, quantity: 1)
        _ = shoppingBasketUnderTest.addItem(basketItem)
        
        XCTAssertEqual(shoppingBasketUnderTest.basketItems.count, 1, "Basket items count not correct after add")
        let addedBasketItem = shoppingBasketUnderTest.basketItems[0]
        XCTAssertEqual(addedBasketItem, basketItem, "Basket items values not equal")
    }
    
    
    func testRemoveItem_RemovedSuccessfully() {
        let shopItem = shopItems[0]
        let basketItem = BasketItem(shopItem: shopItem, quantity: 1)
        _ = shoppingBasketUnderTest.addItem(basketItem)
        
        XCTAssertEqual(shoppingBasketUnderTest.basketItems.count, 1, "Basket items count not correct after add")
        shoppingBasketUnderTest.removeItem(at: 0)
        XCTAssertEqual(shoppingBasketUnderTest.basketItems.count, 0, "Basket items count not correct after remove")
    }

    // TODO: More tests to be written for methods/properties:
    // getItem()
    // isItemExists()
    // count
}
