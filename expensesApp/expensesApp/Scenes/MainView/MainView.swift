//
//  MainView.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 28/05/2021.
//

import UIKit

internal final class MainView: UIView {
    let mainTitle = prepareMainTitle()
    let totalLabel = prepareTotalLabel()
    let expensesTable = prepareExpensesTable()
    
    var expenses: [Expense] = [] {
        didSet {
            updateUI()
        }
    }
    
    init() {
        super.init(frame: .zero)
        setUpView()
        expensesTable.delegate = self
        expensesTable.dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        expensesTable.reloadData()
    }
}

extension MainView: ProgramaticalLayout {
    func setUpViewHierarchy() {
        [mainTitle, totalLabel, expensesTable].forEach({ addSubview($0) })
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 75),
            mainTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            totalLabel.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 15),
            totalLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            expensesTable.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 40),
            expensesTable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            expensesTable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            expensesTable.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func setUpAdditionalConfig() {
        
    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpenseCell.description()) as? ExpenseCell else {
            return UITableViewCell()
        }
        
        cell.expense = expenses[indexPath.row]
        
        return cell
    }
}

fileprivate func prepareMainTitle() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "CURRENT BALANCE"
    label.textColor = .black
    
    return label
}

fileprivate func prepareTotalLabel() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "$ 32.436"
    label.textColor = .black
    
    return label
}

fileprivate func prepareExpensesTable() -> UITableView {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 300
    tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    tableView.bounces = false
    tableView.showsVerticalScrollIndicator = false
    tableView.backgroundColor = .white
    tableView.register(ExpenseCell.self, forCellReuseIdentifier: ExpenseCell.description())
    
    return tableView
}
    
