//
//  UINavigationController.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 03/08/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    static func makeWithTabBarItem(rootController: UIViewController, tabIconNamed: String) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.setViewControllers([rootController], animated: true)
        let image = UIImage(named: tabIconNamed)
        navigationController.tabBarItem = UITabBarItem(title: nil, image: image, tag: 0)
        return navigationController
    }
    
}
