//
//  ShopViewController.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import UIKit

class ShopViewController: UITableViewController {

    // ViewModel property for ShopViewController (MVVM Architecture)
    lazy var viewModel: ShopViewModel = {
        return ShopViewModel()
    }()
    
    // ViewModel property for BasketViewController (MVVM Architecture)
    lazy var basketViewModel: BasketViewModel = {
        return BasketViewModel()
    }()
    
    // Child view controllers
    var basketViewController: BasketViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadShopItems()
        viewModel.basketViewModel = basketViewModel
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.shopItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopItemCell", for: indexPath) as! ShopCellView
        let shopItemViewData = viewModel.getShopItemViewData(at: indexPath.row)
        configureCell(cell, shopItemViewData: shopItemViewData, index: indexPath.row)
        
        return cell
    }
    
    func configureCell(_ cell: ShopCellView, shopItemViewData: ShopItemViewData, index:Int) {
        cell.isAccessibilityElement = true // Required for UI Test recording.
        cell.textLabel!.text = "\(shopItemViewData.name) : \(shopItemViewData.description)"
        cell.detailTextLabel!.text = Common.formatCurrency(number: shopItemViewData.price, code: Global.defaultBaseCurrency, locale:Locale.current)

        cell.addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        cell.addButton.tag = index
        cell.accessoryView = cell.addButton

    }
    
    // Refresh the shop items in the list based on items already addded to shopping basket.
    func refreshShopItems() {
        let tableView = self.view as! UITableView
        
        for row in 1...tableView.numberOfRows(inSection: 0)-1 {
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? ShopCellView {
                let shopItem = viewModel.shopItems[row]
                if basketViewModel.shoppingBasket.isItemExists(shopItem.id) {
                    cell.addButton.isHidden = true
                } else {
                    cell.addButton.isHidden = false
                }
            }
        }
    }

    @objc func addButtonPressed(sender:UIButton) {
        let itemIndex = sender.tag
        viewModel.addToBasket(itemIndex: itemIndex)

        // Disable add.
        if let cell = tableView.cellForRow(at: IndexPath(row: itemIndex, section: 0)) as? ShopCellView {
            cell.addButton.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBasket" {
            basketViewController = segue.destination as? BasketViewController
            basketViewController?.shopViewController = self
            basketViewController?.viewModel = basketViewModel
        }
    }
    
}
