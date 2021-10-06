//
//  CreateViewController.swift
//  Week4-Auth
//
//  Created by Mehmet Salih ÇELİK on 6.10.2021.
//

import UIKit

class CreateViewController: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonAttributes()
        setTextView()
    }
    
    func setButtonAttributes() {
        createButton.layer.cornerRadius = 10
    }
    
    func setTextView() {
        textView.delegate = self
        textView.text = "What was your first car?"
        textView.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
                textView.text = "What was your first car?"
                textView.textColor = UIColor.lightGray
            }
    }

}
