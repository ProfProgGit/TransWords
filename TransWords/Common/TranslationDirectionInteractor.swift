//
//  LanguageInteractor.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 01/08/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

protocol TranslationDirectionInteractor {
    
    var translationDirectionService: TranslationDirectionService { get set }
    var dataService: LanguageCoreDataService { get set }
    
    init(translationDirectionService: TranslationDirectionService,
         dataService: LanguageCoreDataService)
    
    func getSelectedLanguages() -> (source: Language, translateTo: Language)?
    func update(selectedLanguage: Language, for languageGroup: LanguageGroup)
    
}
