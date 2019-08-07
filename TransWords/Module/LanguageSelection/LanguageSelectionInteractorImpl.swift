//
//  LanguageSelectionInteractorImpl.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 31/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

class LanguageSelectionInteractorImpl: LanguageSelectionInteractor {
    
    weak var presenter: LanguageSelectionPresenter?
    var dataService: LanguageCoreDataService

    required init(dataService: LanguageCoreDataService) {
        self.dataService = dataService
    }
    
    func getAllLanguages() -> [Language]? {
        let languages = dataService.fethcAllLanguages()
        return languages?
            .compactMap { $0 }
            .map { Language($0) }
            .compactMap { $0 }
    }
    
}
