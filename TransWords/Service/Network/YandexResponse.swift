//
//  YandexResponse.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 29/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import Foundation

struct YandexResponse: Decodable {
    
    let code: Int
    let lang: String
    let text: [String]
    
}
