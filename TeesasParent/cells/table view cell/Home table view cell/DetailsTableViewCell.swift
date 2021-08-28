//  DetailsTableViewCell.swift
//  TeesasParent
//  Created by iOS-Appentus on 24/March/2020.
//  Copyright © 2020 appentus. All rights reserved.


import UIKit


class DetailsTableViewCell: UITableViewCell {
    @IBOutlet var detailsLbl:UILabel!
    @IBOutlet var updownBtn:UIButton!
    @IBOutlet var percentBGImg:[UIImageView]!
    @IBOutlet var percentView:[UIView]!
    @IBOutlet var percentLbl:[UILabel]!
    @IBOutlet var detailsTypeLbl:[UILabel]!
    
    @IBOutlet var selectBtn:[UIButton]!
    
    @IBOutlet var bottomLine:UIView!
    @IBOutlet var bottomLineUnselected:UIView!
    
    @IBOutlet var tableView:UITableView!
    @IBOutlet var selectButton:UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bottomLine.backgroundColor = selectedBGColorBottomLine
        
        tableView.delegate = self
        tableView.dataSource = self
                
        tableView.layer.cornerRadius = 16
        tableView.clipsToBounds = true
                
        tableView.register(UINib (nibName:"DetailsFullTableViewCell", bundle:nil), forCellReuseIdentifier:"cell")
        tableView.register(UINib (nibName:"DetailsFooterTableViewCell", bundle:nil), forCellReuseIdentifier:"cellHeader")
//        tableView.estimatedRowHeight = 259
//        tableView.rowHeight = 90//UITableView.automaticDimension
        
        for i in 0..<selectBtn.count {
            percentBGImg[i].image = selectedDetailsImg
            selectBtn[i].tag = i
            percentView[i].tag = i
            selectBtn[i].addTarget(self, action:#selector(selectBtn(_:)), for: .touchUpInside)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func selectBtn(_ sender:UIButton) {
        bottomLine.center.x = percentView[sender.tag].center.x
        UIView.animate(withDuration:0.2) {
            self.contentView.layoutIfNeeded()
        }
    }
}

extension DetailsTableViewCell:UITableViewDelegate,UITableViewDataSource {
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 66
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = tableView.dequeueReusableCell(withIdentifier:"cellHeader") as? DetailsFooterTableViewCell
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 60
//    }
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let cell = tableView.dequeueReusableCell(withIdentifier:"cellHeader") as? DetailsFooterTableViewCell
//
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 4 {
            return 50
        } else {
            return 90
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellHeader", for:indexPath) as! DetailsFooterTableViewCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for:indexPath) as! DetailsFullTableViewCell
            
            return cell
        }
    }
    
}


