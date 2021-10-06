//
//  Step2ViewController.swift
//  Week4-Auth
//
//  Created by Mehmet Salih ÇELİK on 5.10.2021.
//

import UIKit

class Step2ViewController: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonAttributes()
    }
    
    func setButtonAttributes() {
        continueButton.layer.cornerRadius = 10
    }

}
