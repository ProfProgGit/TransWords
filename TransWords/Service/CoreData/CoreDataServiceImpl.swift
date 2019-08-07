//
//  LanguageDataCoreInteractor.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 28/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//


import UIKit
import CoreData

class CoreDataServiceImpl {
    
    private func getManagedContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    private func saveContext(_ managedContext: NSManagedObjectContext) {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

// MARK: - LanguageCoreData extension
extension CoreDataServiceImpl: LanguageCoreDataService {
    
    func preloadLanguages() {
        SupportedLanguages.allCases.forEach { saveLanguageWith(code: $0.rawValue, name: $0.name) }
    }
    
    func fetchLanguageBy(code: String) -> LanguageEntity? {
        guard let managedContext = getManagedContext() else {
            return nil
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: EntityName.language.rawValue)
        request.predicate = NSPredicate(format: "code = %@", code)
        if let result = try? managedContext.fetch(request) as? [LanguageEntity],
            result.count > 0 {
            return result[0]
        }
        return nil
    }
    
    func fethcAllLanguages() -> [LanguageEntity]? {
        guard let managedContext = getManagedContext() else {
            return nil
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: EntityName.language.rawValue)
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [nameSort]
        if let result = try? managedContext.fetch(request) as? [LanguageEntity],
            result.count > 0 {
            return result
        }
        return nil
    }
    
    private func saveLanguageWith(code: String, name: String) {
        guard let managedContext: NSManagedObjectContext = getManagedContext() else {
            return
        }
        if fetchLanguageBy(code: code) == nil {
            let language = LanguageEntity(context: managedContext)
            language.code = code
            language.name = name
            saveContext(managedContext)
        }
    }
    
}

// MARK: - TranslatedWordCoreData extension
extension CoreDataServiceImpl: TranslatedWordCoreDataService {
    
    func fetchAllWords() -> [TranslatedWordEntity]? {
        guard let managedContext = getManagedContext() else {
            return nil
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: EntityName.translatedWord.rawValue)
        let wordSort = NSSortDescriptor(key: "queried", ascending: false)
        request.sortDescriptors = [wordSort]
        
        if let result = try? managedContext.fetch(request) as? [TranslatedWordEntity],
            result.count > 0 {
            return result
        }
        return nil
    }
    
    func saveAsTranslatedWord(word: String, wordLanguageCode: String, translation: String, translationLanguageCode: String) {
        guard let managedContext: NSManagedObjectContext = getManagedContext(),
            let wordLanguage = fetchLanguageBy(code: wordLanguageCode),
            let translationLanguage = fetchLanguageBy(code: translationLanguageCode) else {
            return
        }
        var translatedWord = fetchTranslatedWord(word, wordLanguage: wordLanguage, translationLanguage: translationLanguage)
        if translatedWord == nil {
            translatedWord = TranslatedWordEntity(context: managedContext)
            translatedWord?.word = word
            translatedWord?.wordLanguage = wordLanguage
            translatedWord?.translationLanguage = translationLanguage
        }
        translatedWord?.translation = translation
        translatedWord?.queried = Date() as NSDate
        if let translatedWord = translatedWord {
            persist(translatedWord: translatedWord)
        }
    }
    
    private func persist(translatedWord: TranslatedWordEntity) {
        guard let managedContext: NSManagedObjectContext = getManagedContext() else {
            return
        }
        saveContext(managedContext)
    }
    
    private func fetchTranslatedWord(_ word: String, wordLanguage: LanguageEntity, translationLanguage: LanguageEntity) -> TranslatedWordEntity? {
        guard let managedContext: NSManagedObjectContext = getManagedContext() else {
            return nil
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: EntityName.translatedWord.rawValue)
        
        request.predicate = NSPredicate(format: "word = %@ AND wordLanguage = %@ AND translationLanguage = %@", word, wordLanguage, translationLanguage)
        if let result = try? managedContext.fetch(request) as? [TranslatedWordEntity],
            result.count > 0 {
            return result[0]
        }
        return nil
    }
    
    func deleteAllTranslatedWords() {
        guard let managedContext: NSManagedObjectContext = getManagedContext() else {
            return
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: EntityName.translatedWord.rawValue)
        if let result = try? managedContext.fetch(request) as? [TranslatedWordEntity] {
            result.forEach{ managedContext.delete($0) }
        }
        saveContext(managedContext)
    }
    
}

enum EntityName: String {
    
    case language = "LanguageEntity"
    case translatedWord = "TranslatedWordEntity"
    
}

enum SupportedLanguages: String, CaseIterable {
    
    case ru, en, fr, it, es, de, ja
    
    var name: String {
        switch self {
        case .ru:
            return "Russian"
        case .en:
            return "English"
        case .fr:
            return "French"
        case .it:
            return "Italian"
        case .es:
            return "Spanish"
        case .de:
            return "Deutsch"
        case .ja:
            return "Japanese"
        }
    }
    
}

