//
//  LanguageSelectionPresenter.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 01/08/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

class LanguageSelectionPresenterImpl: LanguageSelectionPresenter {
   
    weak var viewController: LanguageSelectionViewController?
    var interactor: LanguageSelectionInteractor
    var translationSelectionInteractor: TranslationDirectionInteractor
    
    var languageGroup: LanguageGroup
    var languages = [Language]()
    var selectedLanguage: Language?
    
    required init(interactor: LanguageSelectionInteractor,
                  translationDirectionInteractor: TranslationDirectionInteractor,
                  languageGroup: LanguageGroup) {
        self.interactor = interactor
        self.translationSelectionInteractor = translationDirectionInteractor
        self.languageGroup = languageGroup
        initDataModel()
    }
    
    private func initDataModel() {
        languages = self.interactor.getAllLanguages() ?? [Language]()
        if let (source, translateTo) = translationSelectionInteractor.getSelectedLanguages() {
            selectedLanguage = languageGroup == .source ? source : translateTo
        }
    }
    
}

// MARK: - TableView methods
extension LanguageSelectionPresenterImpl {
    
    func getSectionsCount() -> Int {
        return 1
    }
    
    func getRowsCount() -> Int {
        return languages.count
    }
    
    func getSectionTitle() -> String {
        return languageGroup.rawValue
    }
    
    func getLanguage(index: Int) -> (name: String, isSelected: Bool) {
        let language = languages[index]
        let isSelected = selectedLanguage != nil && language == selectedLanguage!
        return (name: language.name, isSelected: isSelected)
    }
    
    func didSelectTableRowAt(index: Int) {
        let language = languages[index]
        selectedLanguage = language
        translationSelectionInteractor.update(selectedLanguage: language, for: languageGroup)
        viewController?.reloadData()
    }
    
}
