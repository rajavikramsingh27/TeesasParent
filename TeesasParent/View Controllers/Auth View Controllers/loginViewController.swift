//
//  loginViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 02/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import PanModal

var countryCodeSelected = "+91"

class loginViewController: UIViewController {

    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var passwordTF: DesignableUITextField!
    @IBOutlet weak var countryCodeBtn: UIButton!
    
    @IBOutlet weak var topContinue:NSLayoutConstraint!
    @IBOutlet weak var viewNumberContainer:UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topDistanceForContinue = viewNumberContainer.frame.origin.y+viewNumberContainer.frame.height+300
        topContinue.constant = self.view.frame.height-topDistanceForContinue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.countryCodeBtn.setTitle(countryCodeSelected, for: .normal)
    }
    
    @IBAction func continueBtn(_ sender: custom_button) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ParentCodeViewController") as! ParentCodeViewController
        
//            presentPanModal(vc)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func teesasEdutionAppDownloadBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func selectCountryCode(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "phoneNumberViewController") as! phoneNumberViewController
        presentPanModal(vc)
    }
    
  

}
