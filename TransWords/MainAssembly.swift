//
//  ModuleAssembly.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

class MainAssembly {
    
    func assemdle() -> UITabBarController {
        let mainTabBarViewController = UITabBarController()
        
        let translationAssembly = WordTranslationAssembly()
        let translation = translationAssembly.assemble()
        let history = HistoryAssembly().assemble(withWordTranslationPresenter: translationAssembly.presenter!)
        let settings = SettingsAssembly().assemble()
        
        mainTabBarViewController.viewControllers = [translation, history, settings]
        return mainTabBarViewController
    }
    
}

