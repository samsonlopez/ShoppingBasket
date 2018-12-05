//
//  BasketItemViewData.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 03/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import Foundation

// Data object used between viewController and viewModel (ViewData pattern)
struct BasketItemViewData {
    var name: String
    var quantity: Int
    var price: Double
    var description: String
}
