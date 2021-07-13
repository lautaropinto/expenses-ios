//
//  HomeTabBarController.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 27/06/2021.
//

import UIKit

class HomeTabBarController: UITabBarController, UITabBarControllerDelegate {
    let mainView = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = UITabBarItem(title: "Home", image: nil, selectedImage: nil)
        mainView.tabBarItem = item1
        
        let newExpense = NewExpenseViewController()
        let item2 = UITabBarItem(title: "+", image: nil, selectedImage: nil)
        newExpense.tabBarItem = item2
        
        self.viewControllers = [mainView, newExpense]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is NewExpenseViewController {
            let vc = NewExpenseViewController()
            vc.presentationController?.delegate = mainView
            
            present(vc, animated: true, completion: nil)
            return false
        }
        
        return true
    }
}

