//
//  ProgramaticalLayout.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 28/05/2021.
//

import Foundation

internal protocol ProgramaticalLayout {
    func setUpView()
    func setUpViewHierarchy()
    func setUpConstraints()
    func setUpAdditionalConfig()
}

extension ProgramaticalLayout {
    func setUpView() {
        setUpViewHierarchy()
        setUpConstraints()
        setUpAdditionalConfig()
    }
    
    func setUpAdditionalConfig() { }
}
