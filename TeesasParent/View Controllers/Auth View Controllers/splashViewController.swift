//
//  splashViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 02/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class splashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.0) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "walkthroughViewController") as! walkthroughViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }


}

