//
//  WordTranslationPresenterImpl.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 01/08/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

class WordTranslationPresenterImpl: WordTranslationPresenter  {
    
    weak var viewController: WordTranslationViewController?
    var interactor: WordTranslationInteractor
    var translationDirectionInteractor: TranslationDirectionInteractor
    
    var word: String = ""
    var translation: String = ""
    var errorMessage: String = ""
    
    required init(interactor: WordTranslationInteractor,
                  translationDirectionInteractor: TranslationDirectionInteractor) {
        self.interactor = interactor
        self.translationDirectionInteractor = translationDirectionInteractor
    }
    
    func getTitle() -> String {
        if let selected = translationDirectionInteractor.getSelectedLanguages() {
            return "\(selected.source.name) ➞ \(selected.translateTo.name)"
        }
        return ""
    }
    
    func show(word: String, translation: String) {
        self.word = word
        self.translation = translation
        viewController?.setWord(text: word)
        viewController?.setTranslatedWord(text: translation)
        viewController?.switchTabToThisController()
    }
    
    func userInputEnded(input: String) {
        word = input
        if let selected = translationDirectionInteractor.getSelectedLanguages() {
            interactor.translate(input, from: selected.source, to: selected.translateTo)
        }
    }
    
    func wordTranslationSucceeded(translation: String) {
        self.translation = translation
        viewController?.setTranslatedWord(text: translation)
    }
    
    func wordTranslationFailed(message: String) {
        self.errorMessage = message
        viewController?.setErrorMessage(message: message)
    }
    
}
