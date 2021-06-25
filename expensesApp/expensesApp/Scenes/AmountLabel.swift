//
//  AmountLabel.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 25/06/2021.
//

import UIKit

internal final class AmountLabel: UILabel {
    var amount: Double = 0.0 {
        didSet {
            let currencyFormatter = NumberFormatter()
            currencyFormatter.usesGroupingSeparator = true
            currencyFormatter.numberStyle = .currency
            // localize to your grouping and decimal separator
            currencyFormatter.locale = Locale.current

            // We'll force unwrap with the !, if you've got defined data you may need more error checking

            let priceString = currencyFormatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
            self.text = priceString
        }
    }
}
