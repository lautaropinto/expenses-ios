//
//  NewExpenseViewController.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 26/06/2021.
//

import UIKit

internal final class NewExpenseViewController: UIViewController, NewExpenseLayoutable,  UIAdaptivePresentationControllerDelegate {
    @UsesAutoLayout var mainView = NewExpenseView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.grey
        setUpView()
    }
}

extension NewExpenseViewController: ProgramaticalLayout {
    func saveExpense(amount: Double, description: String) {
        let expense = Expense(description: description, date: Date(), amount: amount, type: .positive)
        LocalExpenseDataSource.shared.newExpense(expense)
        
        self.presentationController?.delegate?.presentationControllerDidDismiss?(self.presentationController!)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUpAdditionalConfig() {
        //TODO: Refactor
        mainView.saveButtonPressed = saveExpense(amount:description:)
        mainView.closeButtonTap = {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
