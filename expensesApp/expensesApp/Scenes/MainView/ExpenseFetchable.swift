//
//  ExpenseFetchable.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 13/07/2021.
//

import Foundation

internal protocol ExpenseFetchable: Expensable {
    func fetchExpenses() -> [Expense]
}

internal extension ExpenseFetchable {
    func fetchExpenses() -> [Expense] {
        return LocalExpenseDataSource.shared.getExpenses()
    }
}
