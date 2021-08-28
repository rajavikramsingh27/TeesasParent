//
//  custom_filter_popup.swift
//  Teesas
//
//  Created by Ayush Pathak on 17/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import KUIPopOver

class custom_filter_popup :UIView{

    @IBAction func allActions(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("selectFilter"), object: sender.tag)
    }
    
    
    
    
}

class DefaultPopOverViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .popover
        popoverPresentationController?.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIPopoverPresentationControllerDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}
