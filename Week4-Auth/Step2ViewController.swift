//
//  Step2ViewController.swift
//  Week4-Auth
//
//  Created by Mehmet Salih ÇELİK on 5.10.2021.
//

import UIKit

class Step2ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var street1TextField: UITextField!
    @IBOutlet weak var street2TextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var postcodeTextField: UITextField!
    
    @IBOutlet weak var buttonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var continueButton: UIButton!
    
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
    
    func setTextField() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        street1TextField.delegate = self
        street2TextField.delegate = self
        stateTextField.delegate = self
        countryTextField.delegate = self
        postcodeTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        buttonTopConstraint.constant = 60
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        buttonTopConstraint.constant = 360
    }
    
    func setButtonAttributes() {
        continueButton.layer.cornerRadius = 10
    }

}
