//
//  SettingsRouter.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 31/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

protocol SettingsRouter {
    
    var navigationController: UINavigationController? { get set }
    
    func pushSourceLanguages()
    func pushTranslateToLanguages()
    
}

