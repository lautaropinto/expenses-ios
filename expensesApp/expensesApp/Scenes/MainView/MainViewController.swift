//
//  MainViewController.swift
//  expensesApp
//
//  Created by Augusto Pinto on 2/2/21.
//

import UIKit

internal final class MainViewController: UIViewController, ProgramaticalLayout {
    let mainView: MainView = {
        let view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    var expenses: [Expense] = [] {
        didSet {
            mainView.expenses = expenses
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpView()
        expenses = Expense.getFakeList()
    }
    
    func setUpViewHierarchy() {
        view.addSubview(mainView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            mainView.heightAnchor.constraint(equalTo: view.heightAnchor),
            mainView.widthAnchor.constraint(equalTo: view.widthAnchor),
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

