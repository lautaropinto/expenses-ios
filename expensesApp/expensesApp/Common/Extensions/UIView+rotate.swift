//
//  UIView+rotate.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 29/06/2021.
//

import UIKit

extension UIView {
    /**
     Rotate a view by specified degrees

     - parameter angle: angle in degrees
     */
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }
}
