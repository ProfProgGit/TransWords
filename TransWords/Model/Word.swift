//
//  WordModel.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 31/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

struct Word {
    
    let word: String
    let translation: String
    
    init?(translatedWord: TranslatedWordEntity) {
        if let word = translatedWord.word,
            let translation = translatedWord.translation {
            self.word = word
            self.translation = translation
        }
        else  {
            return nil
        }
    }
    
}
