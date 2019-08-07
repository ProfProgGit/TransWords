//
//  File.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

protocol LanguageCoreDataService {
    
    func preloadLanguages()
    func fetchLanguageBy(code: String) -> LanguageEntity?
    func fethcAllLanguages() -> [LanguageEntity]?
    
}

protocol TranslatedWordCoreDataService {
    
    func fetchAllWords() -> [TranslatedWordEntity]?
    func saveAsTranslatedWord(word: String, wordLanguageCode: String, translation: String, translationLanguageCode: String)
    func deleteAllTranslatedWords()
    
}

typealias CoreDataService = LanguageCoreDataService & TranslatedWordCoreDataService
