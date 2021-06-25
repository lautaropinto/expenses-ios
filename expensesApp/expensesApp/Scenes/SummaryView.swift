//
//  SummaryView.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 24/06/2021.
//

import UIKit

internal final class SummaryView: UIView {
    let titleLabel = prepareTitleLabel()
    let valueLabel = prepareValueLabel()
    let iconView = UIImageView()
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var value: Double = 0 {
        didSet {
            valueLabel.amount = value
        }
    }
    
    var type: ExpenseType = .negative {
        didSet {
            // update image
        }
    }
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SummaryView: ProgramaticalLayout {
    func setUpViewHierarchy() {
        [titleLabel, valueLabel].forEach{ addSubview($0) }
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            valueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}



fileprivate func prepareTitleLabel() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .worksansRegular.withSize(12)
    label.textColor = Colors.lightPurple
    
    return label
}

fileprivate func prepareValueLabel() -> AmountLabel {
    let label = AmountLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .worksansMedium.withSize(17)
    label.textColor = Colors.white
    
    return label
}
