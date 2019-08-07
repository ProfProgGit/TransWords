//
//  LanguageModel.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 31/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

struct Language {
    
    let code: String
    let name: String
    
    init?(_ language: LanguageEntity) {
        if let code = language.code,
            let name = language.name {
            self.code = code
            self.name = name
        }
        else {
            return nil
        }
    }
    
}

extension Language: Equatable {
    
    static func == (lhs: Language, rhs: Language) -> Bool {
            return lhs.code == rhs.code
    }
    
}
