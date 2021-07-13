//
//  MainViewController.swift
//  expensesApp
//
//  Created by Augusto Pinto on 2/2/21.
//

import UIKit

internal final class MainViewController: UIViewController, ProgramaticalLayout, ExpenseFetchable {
    @UsesAutoLayout var mainView = MainView()
    
    var expenses: [Expense] = [] {
        didSet {
            mainView.expenses = expenses
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        expenses = fetchExpenses()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setUpView()
    }
    
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

extension MainViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        expenses = fetchExpenses()
    }
}
