//
//  CurrencyViewModel.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 02/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import Foundation

class CurrencyViewModel {
    
    // Data access service delegate
    lazy var currencyDataAccess: CurrencyDataAccess = {
        return CurrencyService()
    }()
    
    // Current currency
    var currency: Currency?
    
    // Fetch the currency rates from the data service
    func fetchData(baseCurrency:String, complete: @escaping (_ success: Bool, _ error: DataServiceError?) -> ()) {
        let session = currencyDataAccess.getSession()
        
        _ = currencyDataAccess.getCurrency(baseCurrency:baseCurrency, session: session, complete: { (success, currency, error) in
            if success {
                self.currency = currency
                complete(success, nil)
            } else {
                self.currency = nil
                complete(success, DataServiceError.downloadFailed)
            }
        })
    }
    
    func getCurrencyCellViewData(for currencyCode: String) -> CurrencyViewData {
        var currencyViewData = CurrencyViewData(code: currencyCode, rate: 0) // TODO: Revisit this init with 0 for a better way to do this.
        if let rate = currency?.rates[currencyCode] {
            currencyViewData.rate = rate
        }
        
        return currencyViewData
    }
    
    func getRate(currencyCode: String) -> Double? {
        let rate = currency?.rates[currencyCode]
        return rate
    }
}
