//
//  YandexTranslateInteractor.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 28/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import Foundation

/*
 https://translate.yandex.net/api/v1.5/tr.json/translate
 ? [key=<API-ключ>]
 & [text=<переводимый текст>]
 & [lang=<направление перевода>]
 & [format=<формат текста>]
 & [options=<опции перевода>]
 & [callback=<имя callback-функции>]
 */

class YandexTranslationService: TranslationService {

    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionTask?
    
    func translate(text: String, from sourceCode: String, to translateToCode: String, callback: @escaping (Result<String, TranslationServiceError>) -> Void) {
        guard let url = buildUrlFor(word: text, sourceCode: sourceCode, translateToCode: translateToCode) else {
            return
        }
        dataTask?.cancel()
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            defer { self.dataTask = nil }
            if error != nil {
                callback(.failure(TranslationServiceError.apiError))
                return
            }
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data else {
                    callback(.failure(TranslationServiceError.responseError))
                    return
            }
            
            let decoder = JSONDecoder()
            let decodedResponse = try? decoder.decode(YandexResponse.self, from: data)
            
            if let translations = decodedResponse?.text,
                let translation = translations.first,
                translation != text {
                callback(.success(translation))
                return
            }
            else {
                callback(.failure(TranslationServiceError.noTranslation))
                return
            }
        }
        dataTask?.resume()
    }
    
    private func buildUrlFor(word: String, sourceCode: String, translateToCode: String) -> URL? {
        if var urlComponents = URLComponents(string: YandexUrlComponents.baseUrl.rawValue) {
            urlComponents.queryItems = [
                QueryItem.key.item,
                QueryItem.text(value: word).item,
                QueryItem.lang(fromCode: sourceCode, toCode: translateToCode).item
            ]
            return urlComponents.url
        }
        return nil
    }
    
}

enum QueryItem {
    
    case key
    case text(value: String)
    case lang(fromCode: String, toCode: String)
   
    var item: URLQueryItem {
        switch self {
        case .key:
            return URLQueryItem(name: "key", value: YandexUrlComponents.apiKey.rawValue)
        case .text(let value):
            return URLQueryItem(name: "text", value: value)
        case .lang(let fromCode, let toCode):
            return URLQueryItem(name: "lang", value: "\(fromCode)-\(toCode)")
        }
    }
    
}

enum YandexUrlComponents: String {
    
    case baseUrl = "https://translate.yandex.net/api/v1.5/tr.json/translate"
    case apiKey = "trnsl.1.1.20190722T103306Z.3e0fb8e2c5f3f51e.258df59c6a3d10502ab82d6236feea7bb2bb020c"
    
}




