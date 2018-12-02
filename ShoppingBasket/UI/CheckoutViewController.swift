//
//  CheckoutViewController.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import UIKit

class CheckoutViewController: UITableViewController {
    
    // ViewModel property for CheckoutViewController (MVVM Architecture)
    lazy var viewModel: CheckoutViewModel = {
        return CheckoutViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
