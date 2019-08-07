//
//  LanguageSelectionAssembly.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 31/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

class LanguageSelectionAssembly {

    func assembleWithData(languageGroup: LanguageGroup) -> LanguageSelectionViewController {
        let dataService = CoreDataServiceImpl()
        let translationDirectionService = TranslationDirectionServiceImpl(dataService: dataService)
        
        let interactor = LanguageSelectionInteractorImpl(dataService: dataService)
        interactor.dataService = dataService
        
        let translationDirectionInteractor = TranslationDirectionInteractorImpl(
            translationDirectionService: translationDirectionService,
            dataService: dataService)
        
        let presenter = LanguageSelectionPresenterImpl(interactor: interactor,
                                                       translationDirectionInteractor: translationDirectionInteractor,
                                                       languageGroup: languageGroup)
        
        let identifier = StoryboardIdentifier.languageSelection.rawValue
        let viewController: LanguageSelectionViewController = UIStoryboard.makeViewController(withIdentifier: identifier)
        
        // injections...
        viewController.presenter = presenter
        presenter.viewController = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
}
