//  DetailsViewController.swift
//  TeesasParent
//  Created by iOS-Appentus on 24/March/2020.
//  Copyright © 2020 appentus. All rights reserved.


import UIKit


var selectedDetailsImg = UIImage (named:"bgDetails1.png")
var selectedBGColorBottomLine = hexStringToUIColor(hex:"#0079FC")
var bgColorBottomLineArr = ["#0079FC","#FF612B","#25A935","#C6198E"]

class DetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var upDownArr = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<6 {
            upDownArr.append(false)
        }
        
        tableView.register(UINib (nibName:"DetailsTableViewCell", bundle:nil), forCellReuseIdentifier:"cellDetails")
//        tableView.estimatedRowHeight = 259
//        tableView.rowHeight = 444//UITableView.automaticDimension
    }
    
    @IBAction func backBtn(_ sender:UIButton) {
        self.navigationController?.popViewController(animated:true)
    }
    
}

extension DetailsViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if upDownArr[indexPath.row] {
            return 600
        } else {
            return 190
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cellDetails") as! DetailsTableViewCell
        
        cell.tableView.tag = indexPath.row
        cell.selectButton.tag = indexPath.row
        cell.selectButton.addTarget(self, action:#selector(selectButton(_:)), for:.touchUpInside)
        
        cell.updownBtn.isSelected = upDownArr[indexPath.row]
        
        cell.bottomLine.isHidden = !upDownArr[indexPath.row]
        cell.bottomLineUnselected.isHidden = !upDownArr[indexPath.row]
        
        return cell
    }
    
    @IBAction func selectButton(_ sender:UIButton) {
        for i in 0..<6 {
            if sender.tag == i {
                if upDownArr[i] {
                   upDownArr[i] = false
                } else {
                    upDownArr[i] = true
                }
            }
        }
        tableView.reloadData()
    }
    
    
}
