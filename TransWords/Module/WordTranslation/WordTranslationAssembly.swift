//
//  WordTranslationAssembly.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

class WordTranslationAssembly {
    
    weak private(set) var presenter: WordTranslationPresenter?
    
    func assemble() -> UINavigationController {
        
        let dataService = CoreDataServiceImpl()
        let translationDirectionService = TranslationDirectionServiceImpl(dataService: dataService)
        let translationService = YandexTranslationService()
        
        let interactor = WordTranslationInteractorImpl(transaltionService: translationService, dataService: dataService)
        
        let translationDirectionInteractor = TranslationDirectionInteractorImpl(translationDirectionService: translationDirectionService,
                                                                                dataService: dataService)
        let presenter = WordTranslationPresenterImpl(interactor: interactor,
                                                     translationDirectionInteractor: translationDirectionInteractor)
        
        let identifier = StoryboardIdentifier.translation.rawValue
        let viewController: WordTranslationViewController = UIStoryboard.makeViewController(withIdentifier: identifier)
        
        // injections...
        viewController.presenter = presenter
        presenter.viewController = viewController
        interactor.presenter = presenter
        
        self.presenter = presenter
        
        let navigationController = UINavigationController.makeWithTabBarItem(rootController: viewController,
                                                                             tabIconNamed: TabIconName.translation.rawValue)
        return navigationController
    }
    
}
