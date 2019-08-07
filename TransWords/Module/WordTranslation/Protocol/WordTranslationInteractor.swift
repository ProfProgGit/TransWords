//
//  WordTranslationInteractor.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 01/08/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

protocol WordTranslationInteractor: class {
    
    var transaltionService: TranslationService { get set }
    var dataService: TranslatedWordCoreDataService { get set }
    var presenter: WordTranslationPresenter? { get set }
    
    init(transaltionService: TranslationService, dataService: TranslatedWordCoreDataService)
    
    func translate(_ text: String, from source: Language, to translateTo: Language)
    
}
