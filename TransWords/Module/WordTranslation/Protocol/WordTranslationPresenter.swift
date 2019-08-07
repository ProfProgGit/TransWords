//
//  WordTranslationPresenter.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 01/08/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

protocol WordTranslationPresenter: class {
    
    var viewController: WordTranslationViewController? { get set }
    var interactor: WordTranslationInteractor { get set }
    var translationDirectionInteractor: TranslationDirectionInteractor { get set }
    
    var word: String { get set }
    var translation: String { get set }
    
    init(interactor: WordTranslationInteractor,
         translationDirectionInteractor: TranslationDirectionInteractor)
    
    func getTitle() -> String
    func userInputEnded(input: String)
    func wordTranslationSucceeded(translation: String)
    func wordTranslationFailed(message: String)
    func show(word: String, translation: String)
    
}
