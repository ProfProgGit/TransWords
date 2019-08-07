//
//  TranslatedWordEntity+CoreDataProperties.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 02/08/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//
//

import Foundation
import CoreData


extension TranslatedWordEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TranslatedWordEntity> {
        return NSFetchRequest<TranslatedWordEntity>(entityName: "TranslatedWordEntity")
    }

    @NSManaged public var queried: NSDate?
    @NSManaged public var translation: String?
    @NSManaged public var word: String?
    @NSManaged public var translationLanguage: LanguageEntity?
    @NSManaged public var wordLanguage: LanguageEntity?

}
