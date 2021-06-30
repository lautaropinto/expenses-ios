//
//  NewExpenseView.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 26/06/2021.
//

import UIKit

internal final class NewExpenseView: UIView {
    let closeButton = prepareCloseButton()
    let titleLabel = prepareTitleLabel()
    let amountTextField = prepareAmountTextField()
    let descriptionTextField = prepareDescriptionTextField()
    let saveButton = prepareSaveButton()
    var composeViewBottomConstraint: NSLayoutConstraint = NSLayoutConstraint()
    var saveButtonPressed: ((Double, String) -> Void)?
    var closeButtonTap: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        saveButtonPressed?(amountTextField.amountAsDouble!, descriptionTextField.text!)
    }
}

extension NewExpenseView: ProgramaticalLayout {
    func setUpViewHierarchy() {
        [closeButton, titleLabel, amountTextField, descriptionTextField, saveButton].forEach{ addSubview($0) }
    }
    
    func setUpConstraints() {
        composeViewBottomConstraint = saveButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            closeButton.heightAnchor.constraint(equalToConstant: 44),
            closeButton.widthAnchor.constraint(equalToConstant: 44),
            
            titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 80),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            amountTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            amountTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            amountTextField.heightAnchor.constraint(equalToConstant: 60),
            amountTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.65),
            
            descriptionTextField.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 20),
            descriptionTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 50),
            descriptionTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            
            saveButton.heightAnchor.constraint(equalToConstant: 44),
            saveButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            saveButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            composeViewBottomConstraint,
        ])
    }
    
    func setUpAdditionalConfig() {
        saveButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(closeButtonPressed(_:)), for: .touchUpInside)
        closeButton.rotate(angle: 45)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundPressed(_:)))
        self.addGestureRecognizer(tapGesture)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func closeButtonPressed(_ sender: UIButton) {
        closeButtonTap?()
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo?  [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        
        let keyboardHeight = keyboardSize?.height
        
        self.composeViewBottomConstraint.constant = -keyboardHeight!
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        self.composeViewBottomConstraint.constant =  0
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func backgroundPressed(_ sender: UIView) {
        subviews.forEach{ $0.resignFirstResponder() }
    }
}

fileprivate func prepareCloseButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("+", for: .normal)
    button.titleLabel?.font = .worksansRegular.withSize(30)
    button.setTitleColor(Colors.purple01, for: .normal)
    button.applyShadow()

    return button
}

fileprivate func prepareTitleLabel() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Add new expense"
    label.font = .worksansMedium.withSize(20)
    label.textColor = Colors.purple02
    
    return label
}

fileprivate func prepareAmountTextField() -> CurrencyTextField {
    let text = CurrencyTextField()
    text.translatesAutoresizingMaskIntoConstraints = false
    text.font = .worksansRegular.withSize(35)
    text.textAlignment = .center
    text.keyboardType = .numberPad
    text.placeholder = "$0"
    text.backgroundColor = .white
    text.layer.cornerRadius = 28
    text.applyShadow()
    
    return text
}

fileprivate func prepareDescriptionTextField() -> PaddingTextField {
    let text = PaddingTextField()
    text.translatesAutoresizingMaskIntoConstraints = false
    text.font = .worksansRegular.withSize(16)
    text.textAlignment = .left
    text.backgroundColor = .white
    text.layer.cornerRadius = 10
    text.placeholder = "Note"
    text.applyShadow()
    
    return text
}

fileprivate func prepareSaveButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("SAVE", for: .normal)
    button.titleLabel?.font = .worksansRegular.withSize(16)
    button.backgroundColor = Colors.purple02
    button.layer.cornerRadius = 10
    button.applyShadow()
    
    return button
}
