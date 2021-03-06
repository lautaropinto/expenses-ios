//
//  ExpensesDataSource.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 26/06/2021.
//

import Foundation

internal protocol ExpensesDataSource {
    func getExpenses() -> [Expense]
    
    func newExpense(_ expense: Expense)
}
