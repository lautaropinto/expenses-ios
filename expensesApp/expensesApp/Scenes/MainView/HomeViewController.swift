//
//  MainViewController.swift
//  expensesApp
//
//  Created by Augusto Pinto on 2/2/21.
//

import UIKit

internal final class HomeViewController: UIViewController, HomeLayoutable, ExpenseFetchable {
    @UsesAutoLayout var mainView = HomeView()
    
    var expenses: [Expense] = [] {
        didSet {
            mainView.expenses = expenses
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        expenses = fetchExpenses()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
}

extension HomeViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        expenses = fetchExpenses()
    }
}
