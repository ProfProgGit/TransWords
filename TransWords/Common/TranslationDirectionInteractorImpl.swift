//
//  LanguageInteractorImpl.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 01/08/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

class TranslationDirectionInteractorImpl: TranslationDirectionInteractor {
    
    var translationDirectionService: TranslationDirectionService
    var dataService: LanguageCoreDataService
    
    required init(translationDirectionService: TranslationDirectionService,
                  dataService: LanguageCoreDataService) {
        self.translationDirectionService = translationDirectionService
        self.dataService = dataService
    }
    
    func getSelectedLanguages() -> (source: Language, translateTo: Language)? {
        if let translationDirection = translationDirectionService.getTranslationDirection(),
            let sourceLanguage = Language(translationDirection.sourceLanguage),
            let translateToLanguage = Language(translationDirection.translateToLanguage) {
            return (source: sourceLanguage, translateTo: translateToLanguage)
        }
        return nil
    }
    
    func update(selectedLanguage: Language, for languageGroup: LanguageGroup) {
        if let language = dataService.fetchLanguageBy(code: selectedLanguage.code) {
            translationDirectionService.updateTranslationDirectionWith(language: language, usedAs: languageGroup)
        }
    }
    
}
