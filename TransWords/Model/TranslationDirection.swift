//
//  TranslationDirection.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 28/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import Foundation

struct TranslationDirection {
    
    var sourceLanguage: LanguageEntity {
        didSet {
            if sourceLanguage == translateToLanguage {
                translateToLanguage = oldValue
            }
        }
    }
    
    var translateToLanguage: LanguageEntity {
        didSet {
            if translateToLanguage == sourceLanguage {
                sourceLanguage = oldValue
            }
        }
    }
    
}
