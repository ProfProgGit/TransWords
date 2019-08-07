//
//  Storyboard.swift
//  TransWords
//
//  Created by Dmitry Kholoidlov on 02/08/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func makeViewController<T>(withIdentifier identifier: String) -> T {
        let mainStoryboardName = StoryboardName.main.rawValue
        let mainStoryboard = UIStoryboard(name: mainStoryboardName, bundle: nil)
        let viewController: T =
            mainStoryboard.instantiateViewController(withIdentifier: identifier) as! T
        return viewController
    }
    
}

enum StoryboardName: String {
    
    case main = "Main"
    
}
