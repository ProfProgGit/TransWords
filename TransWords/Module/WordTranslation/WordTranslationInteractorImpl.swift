//
//  WordTranslationInteractorImpl.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 01/08/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import Foundation

class WordTranslationInteractorImpl: WordTranslationInteractor {
    
    var transaltionService: TranslationService
    var dataService: TranslatedWordCoreDataService
    weak var presenter: WordTranslationPresenter?
    
    required init(transaltionService: TranslationService, dataService: TranslatedWordCoreDataService) {
        self.transaltionService = transaltionService
        self.dataService = dataService
    }
    
    func translate(_ text: String, from source: Language, to translateTo: Language) {
        transaltionService.translate(text: text, from: source.code, to: translateTo.code) {
            translationResult in
            DispatchQueue.main.async { [weak self] in
                switch translationResult {
                case .success(let translation):
                    self?.dataService.saveAsTranslatedWord(word: text,
                                                          wordLanguageCode: source.code,
                                                          translation: translation,
                                                          translationLanguageCode: translateTo.code)
                    self?.presenter?.wordTranslationSucceeded(translation: translation)
                case .failure(let error):
                    self?.presenter?.wordTranslationFailed(message: error.rawValue)
                }
                
            }
        }
    }
    
}
