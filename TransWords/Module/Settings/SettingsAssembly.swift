//
//  SettingsAssembly.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

class SettingsAssembly {
    
    func assemble() -> UINavigationController {
        let dataService = CoreDataServiceImpl()
        let translationDirectionService = TranslationDirectionServiceImpl(dataService: dataService)
        
        let translationDirectionInteractor = TranslationDirectionInteractorImpl(translationDirectionService: translationDirectionService,
                                                                                dataService: dataService)
        let router = SettingsRouterImpl()
        let presenter = SettingsPresenterImpl(router: router,
                                              translationDirectionInteractor: translationDirectionInteractor)
        
        let identifier = StoryboardIdentifier.settings.rawValue
        let viewController: SettingsViewController = UIStoryboard.makeViewController(withIdentifier: identifier)
        
        // injections...
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        let navigationController = UINavigationController.makeWithTabBarItem(rootController: viewController,
                                                                             tabIconNamed: TabIconName.settings.rawValue)
        router.navigationController = navigationController
        return navigationController
    }
    
}


