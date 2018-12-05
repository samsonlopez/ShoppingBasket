//
//  Common.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 05/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import Foundation

// Common methods and attributes
class Common {
    
    static func formatDecimal(number: Double, locale: Locale) -> String? {
        return Common.formatNumber(number: number, code: nil, locale: locale)
    }
    
    static func formatCurrency(number: Double, code: String, locale: Locale) -> String? {
        return Common.formatNumber(number: number, code: code, locale: locale)
    }

    private static func formatNumber(number: Double, code: String?, locale: Locale) -> String? {
        
        var formattedNumber: String?
        
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        if let code = code {
            formatter.currencyCode = code
            formatter.numberStyle = .currency
        } else {
            formatter.numberStyle = .decimal
        }
        
        formattedNumber = formatter.string(from: NSNumber(value: number))
        
        return formattedNumber
    }

}
