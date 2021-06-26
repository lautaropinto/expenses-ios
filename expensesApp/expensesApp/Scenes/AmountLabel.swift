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
            currencyFormatter.locale = Locale.current

            let amountString = currencyFormatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
            self.text = amountString
        }
    }
}
