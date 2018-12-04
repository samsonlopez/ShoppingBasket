//
//  ShopViewModelTests.swift
//  ShoppingBasketTests
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import XCTest
@testable import ShoppingBasket

class ShopViewModelTests: XCTestCase {

    var viewModelUnderTest: ShopViewModel!
    var basketViewModel: BasketViewModel!
    
    override func setUp() {
        viewModelUnderTest = ShopViewModel()
        basketViewModel = BasketViewModel()

        viewModelUnderTest.loadShopItems()
        viewModelUnderTest.basketViewModel = basketViewModel
    }

    override func tearDown() {
        viewModelUnderTest = nil
        basketViewModel = nil
    }
    
    func testAddToBasket_AddedSuccessfully() {
        viewModelUnderTest.addToBasket(itemIndex: 0)
        XCTAssertEqual(basketViewModel.shoppingBasket.count, 1, "Basket count incorrect")
        let basketItem = basketViewModel.shoppingBasket.basketItems[0]
        XCTAssertEqual(basketItem.shopItem, viewModelUnderTest.shopItems[0], "Basket shop item values does not match")
    }

    // TODO: More tests to be added for other viewModel methods.
}
