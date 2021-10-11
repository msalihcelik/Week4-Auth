//
//  CreateViewController.swift
//  Week4-Auth
//
//  Created by Mehmet Salih ÇELİK on 6.10.2021.
//

import UIKit

class SecretQuestionViewController: UIViewController {
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        addTapGesture()
    }
    
    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    func configureContents() {
        createButton.layer.cornerRadius = 10
        textView.delegate = self
        textView.text = "What was your first car?"
        textView.textColor = UIColor.lightGray
    }
    
}

// MARK: - UITextViewDelegate
extension SecretQuestionViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "What was your first car?"
            textView.textColor = UIColor.lightGray
        }
    }
    
}
