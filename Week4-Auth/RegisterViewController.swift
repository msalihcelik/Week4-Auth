//
//  SignUpViewController.swift
//  Week4-Auth
//
//  Created by Mehmet Salih ÇELİK on 5.10.2021.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var buttonTopConstraint: NSLayoutConstraint!
    var buttonConstraint: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGesture()
        configureContents()
        observeKeyboard()
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
        emailTextField.delegate = self
        emailConfirmTextField.delegate = self
        passwordTextField.delegate = self
        retypePasswordTextField.delegate = self
        continueButton.layer.cornerRadius = 10
        buttonConstraint = buttonTopConstraint.constant
    }
    
    func setNavigationBar() {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.isTranslucent = false
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        guard (emailTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false) else {
            let alert = UIAlertController(title: "Password or email cannot be empty",
                                          message: "",
                                          preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK",
                                         style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
            return
        }
        
        if (emailTextField.text == emailConfirmTextField.text) && (passwordTextField.text == retypePasswordTextField.text) {
            performSegue(withIdentifier: "toUserInformationVC", sender: nil)
        } else {
            let alert = UIAlertController(title: "Password or email do not match",
                                          message: "",
                                          preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK",
                                         style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
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

