//
//  MainViewLayoutable.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 14/07/2021.
//

import UIKit

internal protocol MainViewLayoutable: UIViewController, ProgramaticalLayout {
    associatedtype T: UIView
    
    var mainView: T { get set }
}

extension MainViewLayoutable {
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
