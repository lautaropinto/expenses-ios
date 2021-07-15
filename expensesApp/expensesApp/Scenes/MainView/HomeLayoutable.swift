//
//  HomeLayoutable.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 13/07/2021.
//

import UIKit

internal protocol HomeLayoutable: MainViewLayoutable {
    var mainView: HomeView { get set }
    
    func setGradientBackground()
}

extension HomeLayoutable {
    
    func setUpAdditionalConfig() {
        navigationController?.isNavigationBarHidden = true
        setGradientBackground()
    }
    
    func setGradientBackground() {
        let colorTop =  Colors.purple01
        let colorMid = Colors.purple02
        let colorBottom = Colors.lightPurple
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.colors = [colorTop.withAlphaComponent(0.9).cgColor,
                                colorMid.withAlphaComponent(0.7).cgColor,
                                colorBottom.withAlphaComponent(0.2).cgColor]
        gradientLayer.locations = [0.0, 1.0]
        let frame = CGRect(origin: self.view.frame.origin,
                           size: CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height*0.4))
        gradientLayer.frame = frame
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
