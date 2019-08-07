//
//  SettingsPresenterImpl.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 31/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

class SettingsPresenterImpl: SettingsPresenter {
    
    weak var viewController: SettingsViewController?
    var translationDirectionInteractor: TranslationDirectionInteractor
    var router: SettingsRouter
    
    required init(router: SettingsRouter,
                  translationDirectionInteractor: TranslationDirectionInteractor) {
        self.router = router
        self.translationDirectionInteractor = translationDirectionInteractor
    }
    
    func getSectionsHeaderName() -> [String] {
        let sectionHeaders: [String] = [LanguageGroup.source.rawValue, LanguageGroup.translateTo.rawValue]
        return sectionHeaders
    }
    
    func getLanguageNames() -> (String, String)? {
        if let selectedLanguages = getSelectedLanguages() {
            return (selectedLanguages.0.name , selectedLanguages.1.name)
        }
        return nil
    }
    
    func getSelectedLanguages() -> (Language, Language)? {
        return translationDirectionInteractor.getSelectedLanguages()
    }
    
    func rowSelectedInSectionWith(index: Int) {
        switch index {
        case 0:
            router.pushSourceLanguages()
        case 1:
            router.pushTranslateToLanguages()
        default:
            break
        }
    }
    
}


