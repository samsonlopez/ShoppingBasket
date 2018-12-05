//
//  CurrencyViewController.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import UIKit

class CurrencyViewController: UITableViewController {
    
    // ViewModel property for CurrencyViewController (MVVM Architecture)
    lazy var viewModel: CurrencyViewModel = {
        return CurrencyViewModel()
    }()

    // Parent view controller
    weak var checkoutViewController: CheckoutViewController? = nil

    // Current base currency and value for which rates are displayed.
    var baseCurrencyCode:String = Global.defaultBaseCurrency
    
    // Currency codes maintained in the order to display in list.
    var currencyCodes = Global.currencyCodes

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyCodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath)
        let currencyItemViewData = viewModel.getCurrencyCellViewData(for: currencyCodes[indexPath.row])
        configureCell(cell, currencyViewData: currencyItemViewData, index: indexPath.row)
        
        return cell
    }
    
    func configureCell(_ cell: UITableViewCell, currencyViewData: CurrencyViewData, index:Int) {
        cell.isAccessibilityElement = true // Required for UI Test recording.
        cell.textLabel!.text = "\(currencyViewData.code)"
        cell.detailTextLabel!.text = "\(currencyViewData.rate)"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // TODO: Values must be passed through data binding attribute.
        let currencyCode = currencyCodes[indexPath.row]
        checkoutViewController?.viewModel.currencyCode = currencyCode
        if let rate = viewModel.getRate(currencyCode: currencyCode) {
            checkoutViewController?.viewModel.currencyRate = rate
        } else {
            checkoutViewController?.viewModel.currencyRate = nil
        }
        checkoutViewController?.refresh()

        self.navigationController?.popViewController(animated: true)
    }
    
    // Fetch data from data service.
    func fetchCurrency() {
        viewModel.fetchData(baseCurrency: baseCurrencyCode) { [weak self] (success, error) in
            DispatchQueue.main.sync {
                //self?.refreshCurrency()
                let tableView = self!.view as! UITableView
                tableView.reloadData()
            }
        }
    }
    
}
