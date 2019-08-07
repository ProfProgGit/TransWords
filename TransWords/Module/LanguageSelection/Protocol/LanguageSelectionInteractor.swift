//
//  LanguageSelectionInteractor.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 31/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

protocol LanguageSelectionInteractor: class {
    
    var presenter: LanguageSelectionPresenter? { get set }
    var dataService: LanguageCoreDataService { get set }
    
    init(dataService: LanguageCoreDataService)
    
    func getAllLanguages() -> [Language]?
    
}
