//
//  HistoryViewPresenter.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

protocol HistoryPresenter: class {
    
    var viewController: HistoryViewController? { get set }
    var router: HistoryRouter { get set }
    var interactor: HistoryInteractor { get set }
    
    init(interactor: HistoryInteractor,
         router: HistoryRouter)
    
    func getSectionsCount() -> Int
    func getRowsCount() -> Int
    func getWordWithTranslationBy(index: Int) -> (word: String, translation: String)
    func viewWillAppear()
    func trashButtonTapped()
    
    func rowSelectedAt(index: Int)
    
    func filterChanged(searchText: String)
    
}
