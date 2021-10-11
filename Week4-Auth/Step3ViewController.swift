//
//  SignUpViewController.swift
//  Week4-Auth
//
//  Created by Mehmet Salih ÇELİK on 5.10.2021.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var buttonTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self,
                                 action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        setButtonAttributes()
        setTextField()

    }
    
    @objc func hideKeyboard() {
            view.endEditing(true)
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setTextField() {
        emailTextField.delegate = self
        emailConfirmTextField.delegate = self
        passwordTextField.delegate = self
        retypePasswordTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        buttonTopConstraint.constant = 100
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        buttonTopConstraint.constant = 400
    }
    
    
    func setButtonAttributes() {
        continueButton.layer.cornerRadius = 10
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
        if emailTextField.text != "" && passwordTextField.text != "" {
            if (emailTextField.text == emailConfirmTextField.text) && (passwordTextField.text == retypePasswordTextField.text) {
                performSegue(withIdentifier: "to2ndVC", sender: nil)
            } else {
                let alert = UIAlertController(title: "Password or email do not match",
                               message: "",
                               preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK",
                                             style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)

            }
        } else {
            let alert = UIAlertController(title: "Password or email cannot be empty",
                           message: "",
                           preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK",
                                         style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
        
        
    }
    
    
    


}
