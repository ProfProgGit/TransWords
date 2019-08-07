//
//  SettingsRouterImpl.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 31/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

class SettingsRouterImpl: SettingsRouter {
    
    weak var navigationController: UINavigationController?
    
    func pushSourceLanguages() {
        pushLanguageViewControllerFor(.source)
    }
    
    func pushTranslateToLanguages() {
        pushLanguageViewControllerFor(.translateTo)
    }
    
    private func pushLanguageViewControllerFor(_ languageGroup: LanguageGroup) {
        let viewController = LanguageSelectionAssembly().assembleWithData(languageGroup: languageGroup)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}


