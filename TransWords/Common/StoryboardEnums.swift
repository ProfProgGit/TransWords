//
//  StoryboardEnums.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 07/08/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

enum StoryboardIdentifier: String {
    
    case languageSelection = "LanguageSelection"
    case translation = "Translation"
    case history = "History"
    case settings = "Settings"
    
}

enum TabIconName: String {
    
    case history = "WordsHistoryTabIcon"
    case settings = "SettingsTabIcon"
    case translation = "TranslationTabIcon"
    
}

enum ViewIdentifier: String {
    
    case languageCell = "LanguageName"
    case historyCell = "WordWithTranslation"
    
}
