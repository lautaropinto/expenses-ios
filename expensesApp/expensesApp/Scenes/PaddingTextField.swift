//
//  PaddingTextField.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 26/06/2021.
//

import UIKit

internal final class PaddingTextField: UITextField {

    let padding = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}


// TODO: borrar si no se usa :D
