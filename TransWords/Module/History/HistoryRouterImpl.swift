//
//  HistoryRouterImpl.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

class HistoryRouterImpl: HistoryRouter {
    
    weak var wordTranslationPresenter: WordTranslationPresenter?
    
    required init(wordTranslationPresenter: WordTranslationPresenter) {
        self.wordTranslationPresenter = wordTranslationPresenter
    }
    
    func showTranslatedWordTab(word: String, translation: String) {
        wordTranslationPresenter?.show(word: word, translation: translation)
    }
    
}
