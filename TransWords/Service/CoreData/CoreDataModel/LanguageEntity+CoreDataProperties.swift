//
//  LanguageEntity+CoreDataProperties.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 02/08/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//
//

import Foundation
import CoreData


extension LanguageEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LanguageEntity> {
        return NSFetchRequest<LanguageEntity>(entityName: "LanguageEntity")
    }

    @NSManaged public var code: String?
    @NSManaged public var name: String?
    @NSManaged public var translatedWords: NSSet?
    @NSManaged public var words: NSSet?

}

// MARK: Generated accessors for translatedWords
extension LanguageEntity {

    @objc(addTranslatedWordsObject:)
    @NSManaged public func addToTranslatedWords(_ value: TranslatedWordEntity)

    @objc(removeTranslatedWordsObject:)
    @NSManaged public func removeFromTranslatedWords(_ value: TranslatedWordEntity)

    @objc(addTranslatedWords:)
    @NSManaged public func addToTranslatedWords(_ values: NSSet)

    @objc(removeTranslatedWords:)
    @NSManaged public func removeFromTranslatedWords(_ values: NSSet)

}

// MARK: Generated accessors for words
extension LanguageEntity {

    @objc(addWordsObject:)
    @NSManaged public func addToWords(_ value: TranslatedWordEntity)

    @objc(removeWordsObject:)
    @NSManaged public func removeFromWords(_ value: TranslatedWordEntity)

    @objc(addWords:)
    @NSManaged public func addToWords(_ values: NSSet)

    @objc(removeWords:)
    @NSManaged public func removeFromWords(_ values: NSSet)

}
