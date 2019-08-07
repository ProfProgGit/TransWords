//
//  WordHistoryViewController.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

class HistoryViewController: UITableViewController, UISearchBarDelegate {
    
    var presenter: HistoryPresenter?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet var wordLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        addTrashButton()
    }
    
    func addTrashButton() {
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.trash,
                                     target: self,
                                     action: #selector(HistoryViewController.trashButtonTapped))
        navigationItem.rightBarButtonItem  = button
    }
    
    @objc func trashButtonTapped() {
        presenter?.trashButtonTapped()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
        reloadTableView()
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
}

// MARK: - SearchBar methods
extension HistoryViewController {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.filterChanged(searchText: searchText)
    }
    
}

// MARK: - TableView methods
extension HistoryViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.getSectionsCount() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection _: Int) -> Int {
        return presenter?.getRowsCount()  ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewIdentifier.historyCell.rawValue,
                                                 for: indexPath)
        if let (word, translation) = presenter?.getWordWithTranslationBy(index: indexPath.row),
            let cell = cell as? HistoryTableCell {
            cell.wordLabel.text = word
            cell.translationLabel.text = translation
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.rowSelectedAt(index: indexPath.row)
    }
    
}
