//
//  HistoryInteractor.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

protocol HistoryInteractor {
    
    var presenter: HistoryPresenter? { get set }
    var dataService: TranslatedWordCoreDataService { get set }
    
    init(dataService: TranslatedWordCoreDataService)
    
    func getWords() -> [Word]
    func deleteAllTranslatedWords()
    
}
