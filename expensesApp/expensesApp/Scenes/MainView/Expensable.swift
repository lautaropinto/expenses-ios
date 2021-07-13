//
//  Expensable.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 13/07/2021.
//

import Foundation

internal protocol Expensable {
    var expenses: [Expense] { get set }
    
    init()
}
