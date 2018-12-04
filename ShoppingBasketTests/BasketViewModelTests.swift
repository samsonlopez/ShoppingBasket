//
//  BasketViewModelTests.swift
//  ShoppingBasketTests
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import XCTest
@testable import ShoppingBasket

class BasketViewModelTests: XCTestCase {

    var viewModelUnderTest: BasketViewModel!
    var shopViewModel: ShopViewModel!
    
    override func setUp() {
        viewModelUnderTest = BasketViewModel()
        shopViewModel = ShopViewModel()
        
        shopViewModel.loadShopItems()
        shopViewModel.basketViewModel = viewModelUnderTest
    }
    
    override func tearDown() {
        viewModelUnderTest = nil
        shopViewModel = nil
    }
    
    func testRemoveFromBasket() {
        
        // Add to basket for initial data.
        shopViewModel.addToBasket(itemIndex: 0)
        XCTAssertEqual(viewModelUnderTest.shoppingBasket.count, 1, "Basket count incorrect on add")
        let basketItem = viewModelUnderTest.shoppingBasket.basketItems[0]
        XCTAssertEqual(basketItem.shopItem, shopViewModel.shopItems[0], "Basket shop item values does not match")

        // Test remove.
        viewModelUnderTest.removeFromBasket(itemIndex: 0)
        XCTAssertEqual(viewModelUnderTest.shoppingBasket.count, 0, "Basket count incorrect on remove")
    }
    
    // TODO: Tests for other BasketViewModel methods.

}
