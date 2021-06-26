//
//  ExpenseCell.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 28/05/2021.
//

import UIKit

internal final class ExpenseCell: UITableViewCell {
    let containerView = prepareContainerView()
    let descriptionLabel = prepareDescriptionLabel()
    let dateLabel = prepareDateLabel()
    let amountLabel = prepareAmountLabel()
    
    var expense: Expense = Expense(description: "", date: Date(), amount: 0, type: .negative) {
        didSet {
            updateUI()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        descriptionLabel.text = expense.description
        updateAmount()
        formatDate()
    }
    
    private func updateAmount() {
        amountLabel.amount = expense.amount
        amountLabel.text = expense.type == .positive ? "+ \(amountLabel.text!)" : "- \(amountLabel.text!)"
        amountLabel.textColor = expense.type == .positive ? Colors.green : Colors.red
    }
    
    private func formatDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        dateLabel.text = dateFormatter.string(from: expense.date)
    }
}

// MARK:- AutoLayout
extension ExpenseCell: ProgramaticalLayout {
    func setUpViewHierarchy() {
        [descriptionLabel, dateLabel, amountLabel].forEach({ containerView.addSubview($0) })
        contentView.addSubview(containerView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            descriptionLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            dateLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15),
            
            amountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            amountLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
    }
    
    func setUpAdditionalConfig() {
        self.backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }
}

// MARK:- UI Builders
fileprivate func prepareContainerView() -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 0.1
    view.layer.shadowOffset = .zero
    view.layer.shadowRadius = 50
    view.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
    view.layer.cornerRadius = 6
    
    return view
}

fileprivate func prepareDescriptionLabel() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .worksansMedium.withSize(17)
    label.textColor = .black
    
    return label
}

fileprivate func prepareDateLabel() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .worksansRegular.withSize(13)
    label.textColor = .black
    
    return label
}

fileprivate func prepareAmountLabel() -> AmountLabel {
    let label = AmountLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .worksansMedium.withSize(15)
    label.textColor = .black
    
    return label
}
