//
//  MainView.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 28/05/2021.
//

import UIKit

internal final class MainView: UIView {
    let backgroundView = prepareBackgroundView()
    let mainTitle = prepareMainTitle()
    let totalLabel = prepareTotalLabel()
    let expensesTable = prepareExpensesTable()
    @UsesAutoLayout var incomeView = SummaryView()
    @UsesAutoLayout var expenseView = SummaryView()
    
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
        updateBalance()
    }
    
    private func updateBalance() {
        let positiveExpenses = expenses.filter{ $0.type == .positive }.map{$0.amount}.reduce(0, +)
        let negativeExpenses = expenses.filter{ $0.type == .negative }.map{$0.amount}.reduce(0, +)
        
        incomeView.title = "INCOME"
        incomeView.value = positiveExpenses
        incomeView.type = .positive
        
        expenseView.title = "EXPENSE"
        expenseView.value = negativeExpenses
        expenseView.type = .negative
        
        totalLabel.amount = positiveExpenses - negativeExpenses
    }
}

// MARK:- AutoLayout
extension MainView: ProgramaticalLayout {
    func setUpViewHierarchy() {
        [backgroundView, mainTitle, totalLabel, incomeView, expenseView, expensesTable].forEach({ addSubview($0) })
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            backgroundView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            mainTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            mainTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            incomeView.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 30),
            incomeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65),
            incomeView.heightAnchor.constraint(equalToConstant: 50),
            
            expenseView.topAnchor.constraint(equalTo: incomeView.topAnchor),
            expenseView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -65),
            
            totalLabel.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 15),
            totalLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            expensesTable.topAnchor.constraint(equalTo: incomeView.bottomAnchor, constant: 20),
            expensesTable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            expensesTable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            expensesTable.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

// MARK:- Table view
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


// MARK:- UIBuilders
fileprivate func prepareMainTitle() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "CURRENT BALANCE"
    label.font = .worksansRegular.withSize(12)
    label.textColor = Colors.lightPurple
    
    return label
}

fileprivate func prepareTotalLabel() -> AmountLabel {
    let label = AmountLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .worksansMedium.withSize(45)
    label.textColor = Colors.white
    
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
    tableView.backgroundColor = .clear
    tableView.register(ExpenseCell.self, forCellReuseIdentifier: ExpenseCell.description())
//    table.
    
    return tableView
}
    
fileprivate func prepareBackgroundView() -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
}
