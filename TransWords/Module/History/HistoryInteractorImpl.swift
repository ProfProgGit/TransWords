//
//  HistoryInteractorImpl.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

class HistoryInteractorImpl: HistoryInteractor {
    
    weak var presenter: HistoryPresenter?
    var dataService: TranslatedWordCoreDataService
    
    required init(dataService: TranslatedWordCoreDataService) {
        self.dataService = dataService
    }
    
    func getWords() -> [Word] {
        let translatedWords = dataService.fetchAllWords()
        return translatedWords?
            .map { Word(translatedWord: $0) }
            .compactMap { $0 } ?? [Word]()
    }
    
    func deleteAllTranslatedWords() {
        dataService.deleteAllTranslatedWords()
    }
    
}
