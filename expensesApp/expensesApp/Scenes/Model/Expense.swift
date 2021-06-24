//
//  Expense.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 28/05/2021.
//

import Foundation

internal struct Expense {
    let description: String
    let date: Date
    let amount: Double
    let type: ExpenseType
}

internal enum ExpenseType {
    case positive
    case negative
}

extension Expense {
    static func getFakeList() -> [Expense] {
        return [
            Expense(description: "Fly to Paris", date: Date.init(), amount: 14354, type: .negative),
            Expense(description: "RP shop", date: Date.init(), amount: 1154.5, type: .negative),
            Expense(description: "ASDFAS", date: Date.init(), amount: 14354, type: .negative),
            Expense(description: "ASDFAS", date: Date.init(), amount: 14354, type: .negative),
        ]
    }
}
