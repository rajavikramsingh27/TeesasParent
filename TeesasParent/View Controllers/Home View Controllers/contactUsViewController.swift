//  contactUsViewController.swift
//  Teesas
//  Created by Ayush Pathak on 18/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.


import UIKit


class contactUsViewController: UIViewController {
    @IBOutlet weak var feedBackTf: DesignableUITextField!
    @IBOutlet weak var thanksPopupView: UIView!
    @IBOutlet weak var okayThanksBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        okayThanksBtn.roundCorners(corners: [.bottomRight,.bottomLeft], radius: 26.0)
        self.thanksPopupView.alpha = 0.0
    }
    
    @IBAction func okayBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.25) {
            self.thanksPopupView.alpha = 0.0
        }
    }
    
    @IBAction func sendBtn(_ sender: custom_button) {
        self.view.endEditing(true)
        feedBackTf.text = ""
        UIView.animate(withDuration: 0.25) {
            self.thanksPopupView.alpha = 1.0
        }
    }
    
    @IBAction func callUsBtn(_ sender: Any) {
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
