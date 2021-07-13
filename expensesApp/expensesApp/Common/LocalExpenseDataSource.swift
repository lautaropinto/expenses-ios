//
//  LocalExpenseDataSource.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 26/06/2021.
//

import Foundation

internal final class LocalExpenseDataSource: ExpensesDataSource {
    static var shared = LocalExpenseDataSource()
        
    var expenses: [Expense] = Expense.getFakeList() //TODO: Remove
    
    func getExpenses() -> [Expense] {
        return expenses
    }
    
    func newExpense(_ expense: Expense) {
        expenses.insert(expense, at: 0)
    }
}
