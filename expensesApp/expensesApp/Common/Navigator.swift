//
//  Navigator.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 21/02/2021.
//

import UIKit

internal class Navigator: NavigatorProtocol {
    public var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func push(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popToRoot(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func pop(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func setRoot(_ viewController: UIViewController) {
        navigationController.setViewControllers([viewController], animated: false)
    }
}
