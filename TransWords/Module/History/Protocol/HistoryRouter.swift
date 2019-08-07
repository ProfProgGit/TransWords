//
//  HistoryRouter.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

protocol HistoryRouter {
    
    var wordTranslationPresenter: WordTranslationPresenter? { get set }
    
    init(wordTranslationPresenter: WordTranslationPresenter)
    
    func showTranslatedWordTab(word: String, translation: String)
    
}
