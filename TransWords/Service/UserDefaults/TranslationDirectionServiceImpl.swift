//
//  TranslationDirectionInteractor.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import Foundation

class TranslationDirectionServiceImpl: TranslationDirectionService {
    
    var dataService: LanguageCoreDataService
    
    required init(dataService: LanguageCoreDataService) {
        self.dataService = dataService
    }
    
    func getTranslationDirection() -> TranslationDirection? {
        if let sourceLanguageCode = UserDefaults.standard.string(forKey: UserDefaultsKey.source.rawValue),
            let translateToLanguageCode = UserDefaults.standard.string(forKey: UserDefaultsKey.translateTo.rawValue),
            let sourceLanguage = dataService.fetchLanguageBy(code: sourceLanguageCode),
            let translateToLanguage = dataService.fetchLanguageBy(code: translateToLanguageCode) {
            return TranslationDirection(sourceLanguage: sourceLanguage, translateToLanguage: translateToLanguage)
        }
        return nil
    }
    
    func updateTranslationDirectionWith(language: LanguageEntity, usedAs languageGroup: LanguageGroup) {
        guard var translationDirection = getTranslationDirection() else {
            return
        }
        if languageGroup == .source {
            translationDirection.sourceLanguage = language
        }
        else {
            translationDirection.translateToLanguage = language
        }
        save(translationDirection: translationDirection)
    }
    
    private func save(translationDirection: TranslationDirection) {
        if let sourceLanguageCode = translationDirection.sourceLanguage.code,
            let translateToLanguageCode = translationDirection.translateToLanguage.code {
            UserDefaults.standard.set(sourceLanguageCode, forKey: UserDefaultsKey.source.rawValue)
            UserDefaults.standard.set(translateToLanguageCode, forKey: UserDefaultsKey.translateTo.rawValue)
        }
    }
    
}

enum UserDefaultsKey: String {
    
    case source = "SourceLanguage"
    case translateTo = "TranslateToLanguage"
    
}
