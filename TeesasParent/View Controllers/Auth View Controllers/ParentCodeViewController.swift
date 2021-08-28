//
//  ParentCodeViewController.swift
//  TeesasParent
//
//  Created by iOS-Appentus on 23/March/2020.
//  Copyright © 2020 appentus. All rights reserved.
//

import UIKit
import PanModal


class ParentCodeViewController: UIViewController {

    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var mobileLbl:UILabel!
    
    @IBOutlet weak var topContinue:NSLayoutConstraint!
    @IBOutlet weak var viewNumberContainer:UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topDistanceForContinue = viewNumberContainer.frame.origin.y+viewNumberContainer.frame.height+370
        topContinue.constant = self.view.frame.height-topDistanceForContinue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func continueBtn(_ sender: custom_button) {
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "tabbar")
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func callUsBtn(_ sender: UIButton) {
     
    }
    
    @IBAction func resendCodeBtn(_ sender: UIButton) {
        
    }
}
