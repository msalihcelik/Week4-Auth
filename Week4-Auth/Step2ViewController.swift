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

        continueButton.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.isTranslucent = true
        navigationBar?.backgroundColor = UIColor.white
        navigationBar?.tintColor = UIColor.systemBlue
    }
    

}
