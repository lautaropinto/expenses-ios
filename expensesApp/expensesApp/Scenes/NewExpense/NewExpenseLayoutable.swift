//
//  NewExpenseLayoutable.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 14/07/2021.
//

import UIKit

internal protocol NewExpenseLayoutable: MainViewLayoutable {
    var mainView: NewExpenseView { get set }
}
