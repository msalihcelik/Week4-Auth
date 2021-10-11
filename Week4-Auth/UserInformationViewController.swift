//
//  Step2ViewController.swift
//  Week4-Auth
//
//  Created by Mehmet Salih ÇELİK on 5.10.2021.
//

import UIKit

class UserInformationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var street1TextField: UITextField!
    @IBOutlet weak var street2TextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var postcodeTextField: UITextField!
    @IBOutlet weak var buttonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var continueButton: UIButton!
    var buttonConstraint: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        setDelegate()
        addTapGesture()
        observeKeyboard()
    }
    
    func setDelegate() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        street1TextField.delegate = self
        street2TextField.delegate = self
        stateTextField.delegate = self
        countryTextField.delegate = self
        postcodeTextField.delegate = self
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
        continueButton.layer.cornerRadius = 10
        buttonConstraint = buttonTopConstraint.constant
    }
    
    func observeKeyboard() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    @objc
    func keyboardWillShow(_ notification: Notification) {
        let keyboardHeight = getKeyboardHeight(notification: notification)
        buttonTopConstraint.constant = buttonConstraint
        buttonTopConstraint.constant -= keyboardHeight
    }
    
    @objc
    func keyboardWillHide(_ notification: Notification) {
        let keyboardHeight = getKeyboardHeight(notification: notification)
        buttonTopConstraint.constant += keyboardHeight
    }
    
    func getKeyboardHeight(notification: Notification) -> CGFloat {
        guard let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height else { return 0 }
        return keyboardHeight
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
}

