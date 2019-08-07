//
//  HistoryPresenterImpl.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

class HistoryPresenterImpl: HistoryPresenter {
   
    weak var viewController: HistoryViewController?
    var router: HistoryRouter
    var interactor: HistoryInteractor
    
    var words: [Word] = [Word]()
    var filteredWords = [Word]()
    var searchText = ""
    var displayedWords: [Word] {
        return searchText.isEmpty ? words : filteredWords
    }
    
    required init(interactor: HistoryInteractor,
                  router: HistoryRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewWillAppear() {
        updateModel()
    }
    
    func trashButtonTapped() {
        interactor.deleteAllTranslatedWords()
        updateModel()
        viewController?.reloadTableView()
    }
    
    private func updateModel() {
        words = interactor.getWords()
        setFilteredWords()
    }
    
}

// MARK: - data for table
extension HistoryPresenterImpl {
    
    func getSectionsCount() -> Int {
        return 1
    }
    
    func getRowsCount() -> Int {
        return displayedWords.count
    }
    
    func getWordWithTranslationBy(index: Int) -> (word: String, translation: String) {
        return (displayedWords[index].word, displayedWords[index].translation)
    }
    
    func rowSelectedAt(index: Int) {
        let selected = displayedWords[index]
        router.showTranslatedWordTab(word: selected.word, translation: selected.translation)
    }
    
}

// MARK: - search
extension HistoryPresenterImpl {
    
    func filterChanged(searchText: String) {
        self.searchText = searchText
        setFilteredWords()
        viewController?.reloadTableView()
    }
    
    private func setFilteredWords() {
        if searchText.isEmpty {
            filteredWords = [Word]()
        }
        else {
            filteredWords = words.filter {
                filterText($0.word, by: searchText) || filterText($0.translation, by: searchText)
            }
        }
    }
    
    private func filterText(_ text: String, by searchText: String) -> Bool {
        return text.range(of: searchText, options: [.caseInsensitive, .diacriticInsensitive], range: nil, locale: nil) != nil
    }
    
}
