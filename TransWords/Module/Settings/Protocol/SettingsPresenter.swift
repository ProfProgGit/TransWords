//
//  SettingsPresenter.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 31/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

protocol SettingsPresenter: class {
    
    var viewController: SettingsViewController? { get set }
    var translationDirectionInteractor: TranslationDirectionInteractor { get set }
    var router: SettingsRouter { get set }
    
    init(router: SettingsRouter,
         translationDirectionInteractor: TranslationDirectionInteractor)
    
    func getSectionsHeaderName() -> [String]
    func getLanguageNames() -> (String, String)?
    
    func rowSelectedInSectionWith(index: Int)
    
}
