//
//  UIView+applyShadow.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 29/06/2021.
//

import Foundation

extension UIView {
    func applyShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.15
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 50
        self.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
    }
}
