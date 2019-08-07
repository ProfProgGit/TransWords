//
//  SettingViewController.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    var presenter: SettingsPresenter?
    
    @IBOutlet weak var sourceLanguageLabel: UILabel!
    @IBOutlet weak var translateToLanguageLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let languageNames = presenter?.getLanguageNames() ?? ("", "")
        sourceLanguageLabel.text = languageNames.0
        translateToLanguageLabel.text = languageNames.1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.getSectionsHeaderName()[section] ?? ""
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.rowSelectedInSectionWith(index: indexPath.section)
    }
    
}


