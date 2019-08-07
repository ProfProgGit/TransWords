//
//  HistoryAssembly.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

class HistoryAssembly {
    
    func assemble(withWordTranslationPresenter wordTranslationPresenter: WordTranslationPresenter) -> UINavigationController {
        
        let dataService = CoreDataServiceImpl()
        
        let interactor = HistoryInteractorImpl(dataService: dataService)
        let router = HistoryRouterImpl(wordTranslationPresenter: wordTranslationPresenter)
        let presenter = HistoryPresenterImpl(interactor: interactor, router: router)
        
        let identifier = StoryboardIdentifier.history.rawValue
        let viewController: HistoryViewController = UIStoryboard.makeViewController(withIdentifier: identifier)
        
        // injections...
        viewController.presenter = presenter
        presenter.viewController = viewController
        interactor.presenter = presenter
        
        let navigationController = UINavigationController.makeWithTabBarItem(rootController: viewController,
                                                                             tabIconNamed: TabIconName.history.rawValue)
        return navigationController
    }
    
}
