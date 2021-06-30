//
//  NewExpenseViewController.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 26/06/2021.
//

import UIKit

internal final class NewExpenseViewController: UIViewController,  UIAdaptivePresentationControllerDelegate {
    let mainView: NewExpenseView = {
        let view = NewExpenseView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.grey
        setUpView()
    }
}

extension NewExpenseViewController: ProgramaticalLayout {
    func setUpViewHierarchy() {
        view.addSubview(mainView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func saveExpense(amount: Double, description: String) {
        let expense = Expense(description: description, date: Date(), amount: amount, type: .positive)
        LocalExpenseDataSource.shared.newExpense(expense)
        
        self.presentationController?.delegate?.presentationControllerDidDismiss?(self.presentationController!)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUpAdditionalConfig() {
        mainView.saveButtonPressed = saveExpense(amount:description:)
        mainView.closeButtonTap = {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
