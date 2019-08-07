//
//  LanguageSelectionPresenterProtocol.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

protocol LanguageSelectionPresenter: class {
    
    var viewController: LanguageSelectionViewController? { get set }
    var interactor: LanguageSelectionInteractor { get set }
    var translationSelectionInteractor: TranslationDirectionInteractor { get set }
    
    init(interactor: LanguageSelectionInteractor,
         translationDirectionInteractor: TranslationDirectionInteractor,
         languageGroup: LanguageGroup)
    
    func getSectionsCount() -> Int
    func getRowsCount() -> Int
    func getSectionTitle() -> String
    func getLanguage(index: Int) -> (name: String, isSelected: Bool)
    
    func didSelectTableRowAt(index: Int)
    
}
