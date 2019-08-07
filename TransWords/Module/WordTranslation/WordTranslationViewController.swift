//
//  WordTranslationViewController.swift
//  TransWords
//
//  Created by Dmitry Kholodilov on 30/07/2019.
//  Copyright © 2019 Dmitry Kholodilov. All rights reserved.
//

import UIKit

class WordTranslationViewController: UIViewController {
    
    @IBOutlet weak var translationView: UIView!
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var translatedWordTextView: UITextView!
    @IBOutlet weak var wordSeparatorView: UIView!
    
    var presenter: WordTranslationPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        translationView.clipsToBounds = true
        translationView.layer.cornerRadius = 10.0
        
        wordSeparatorView.layer.cornerRadius = 1.0
        translatedWordTextView.isUserInteractionEnabled = false
        wordTextField.delegate = self
        
        wordTextField.addTarget(self,
                                action: #selector(WordTranslationViewController.wordTextFieldDidChange),
                                for: UIControl.Event.editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = presenter?.getTitle();
    }
    
    @objc func wordTextFieldDidChange() {
        translatedWordTextView.text = ""
    }
    
    func setWord(text: String) {
        wordTextField.text = text
    }
    
    func setTranslatedWord(text: String) {
        translatedWordTextView.textColor = nil
        translatedWordTextView.text = text
    }
    
    func setErrorMessage(message: String) {
        translatedWordTextView.textColor = UIColor.red
        translatedWordTextView.text = message
    }
    
    func switchTabToThisController() {
        tabBarController?.selectedIndex = 0
    }
    
}

extension WordTranslationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = wordTextField.text {
            presenter?.userInputEnded(input: text)
        }
        self.view.endEditing(true)
        return true
    }
    
}
