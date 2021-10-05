//
//  SignUpViewController.swift
//  Week4-Auth
//
//  Created by Mehmet Salih ÇELİK on 5.10.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        passwordTextField.isSecureTextEntry = true
//        retypePasswordTextField.isSecureTextEntry = true

        // Do any additional setup after loading the view.
//        let navigationBar = navigationController?.navigationBar
        
//        navigationBar?.barTintColor = UIColor.clear
        
//        navigationBar?.isTranslucent = false
//        navigationBar?.setBackgroundImage(UIImage(), for: .default)
//        navigationBar?.shadowImage = UIImage()
        
//        let navigationBarApperance = UINavigationBarAppearance()
//        navigationBarApperance.shadowColor = .clear
//        navigationBar?.scrollEdgeAppearance = navigationBarApperance
        setNavigationBar()
        
        
//        continueButton.backgroundColor = .clear
        continueButton.layer.cornerRadius = 10
    }
    
    func setNavigationBar() {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.isTranslucent = false
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
    }
    


}
