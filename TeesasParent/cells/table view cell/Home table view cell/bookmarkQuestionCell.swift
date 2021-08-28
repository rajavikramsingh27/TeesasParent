//  bookmarkQuestionCell.swift
//  Teesas
//  Created by Ayush Pathak on 17/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.


import UIKit


class bookmarkQuestionCell: UITableViewCell {
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var bookmarkBtn: UIButton!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var questionCatogeyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
}
