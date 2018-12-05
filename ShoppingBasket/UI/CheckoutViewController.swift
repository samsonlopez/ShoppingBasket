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

    // Parent view controller
    weak var basketViewController: BasketViewController!

    @IBOutlet weak var currencyCell: UITableViewCell!
    @IBOutlet weak var exchangeRateCell: UITableViewCell!
    @IBOutlet weak var totalCell: UITableViewCell!
    
    // Child view controllers
    var currencyViewController: CurrencyViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        refresh()
    }
    
    func refresh() {
        currencyCell.detailTextLabel?.text = viewModel.currencyCode

        let locale = Locale(identifier:"en_GB")
        if let currencyRate = viewModel.currencyRate {
            exchangeRateCell.detailTextLabel?.text = Common.formatDecimal(number: currencyRate, locale:locale)
            
            
            let total = basketViewController.viewModel.getTotal()
            //let exchangeTotal = total * viewModel.currencyRate
            
            let exchangeTotal = viewModel.getExchangeTotal(total: total, rate: currencyRate)
            totalCell.detailTextLabel?.text = Common.formatCurrency(number: exchangeTotal, code: viewModel.currencyCode, locale:locale)
        } else {
            exchangeRateCell.detailTextLabel?.text = "--"
            totalCell.detailTextLabel?.text = "--"
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCurrency" {
            currencyViewController = segue.destination as? CurrencyViewController
            currencyViewController?.checkoutViewController = self
            currencyViewController?.fetchCurrency()
        }
    }

}
