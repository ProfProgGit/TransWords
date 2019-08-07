//
//  TrtanslateInteractorProtocol.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 22/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

protocol TranslationService {

    func translate(text: String, from sourceCode: String, to translateToCode: String, callback: @escaping (Result<String, TranslationServiceError>) -> Void)
    
}

enum TranslationServiceError: String, Error {
    
    case apiError = "Translation service not available"
    case responseError = "Translation service returned error"
    case noTranslation = "Translation not found"
    
}
