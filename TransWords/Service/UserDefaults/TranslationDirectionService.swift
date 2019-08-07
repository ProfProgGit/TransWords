//
//  TranslationDirectionService.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 31/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

protocol TranslationDirectionService {
    
    var dataService: LanguageCoreDataService { get set }
    
    init(dataService: LanguageCoreDataService)
    func getTranslationDirection() -> TranslationDirection?
    func updateTranslationDirectionWith(language: LanguageEntity, usedAs languageGroup: LanguageGroup)
    
}
