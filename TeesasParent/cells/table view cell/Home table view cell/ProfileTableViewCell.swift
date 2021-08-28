//  ProfileTableViewCell.swift
//  TeesasParent
//  Created by iOS-Appentus on 24/March/2020.
//  Copyright © 2020 appentus. All rights reserved.


import UIKit


class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView:UIImageView!
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var subTitleLbl:UILabel!
    @IBOutlet weak var buttonSelect:UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
