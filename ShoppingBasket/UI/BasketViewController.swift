//
//  BasketViewController.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import UIKit

class BasketViewController: UITableViewController {
    
    // ViewModel reference property for BasketViewController, created in ShopViewController
    weak var viewModel: BasketViewModel!
    
    // Parent view controller
    weak var shopViewController: ShopViewController!
    
    // Child view controllers
    var checkoutViewController: CheckoutViewController? = nil


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.shoppingBasket.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketItemCell", for: indexPath)
        let basketItemViewData = viewModel.getBasketItemViewData(at: indexPath.row)
        configureCell(cell, basketItemViewData: basketItemViewData, index: indexPath.row)
        
        return cell
    }
    
    func configureCell(_ cell: UITableViewCell, basketItemViewData: BasketItemViewData, index:Int) {
        cell.isAccessibilityElement = true // Required for UI Test recording.
        cell.textLabel!.text = "\(basketItemViewData.name) : \(basketItemViewData.description)"
        cell.detailTextLabel!.text = Common.formatCurrency(number: basketItemViewData.price, code: Global.defaultBaseCurrency, locale:Locale.current)
        
        let removeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        removeButton.setTitle("Remove", for: .normal)
        removeButton.setTitleColor(UIColor.blue, for: .normal)
        removeButton.addTarget(self, action: #selector(removeButtonPressed), for: .touchUpInside)
        removeButton.tag = index
        cell.accessoryView = removeButton
    }
    
    @objc func removeButtonPressed(sender:UIButton) {
        let itemIndex = sender.tag
        viewModel.removeFromBasket(itemIndex: itemIndex)
        let tableView = self.view as! UITableView
        tableView.reloadData()
    }
    
    // Executed on back button (reverse segue)
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
    
        if parent == nil {
            shopViewController.refreshShopItems()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCheckout" {
            checkoutViewController = segue.destination as? CheckoutViewController
            checkoutViewController?.basketViewController = self
        }
    }
}
