//
//  LanguageSelectionViewController.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 01/08/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

class LanguageSelectionViewController: UITableViewController {
    
    var presenter: LanguageSelectionPresenter?
    
}

// MARK: - TableView methods
extension LanguageSelectionViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.getSectionsCount() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection _: Int) -> String? {
        return presenter?.getSectionTitle() ?? ""
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection _: Int) -> Int {
        return presenter?.getRowsCount() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewIdentifier.languageCell.rawValue, for: indexPath)
        if let language = presenter?.getLanguage(index: indexPath.row) {
            cell.textLabel?.text = language.name
            cell.accessoryType = language.isSelected ? .checkmark : .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectTableRowAt(index: indexPath.row)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}
