//
//  activityTableViewCell.swift
//  TeesasParent
//
//  Created by iOS-Appentus on 24/March/2020.
//  Copyright © 2020 appentus. All rights reserved.
//

import UIKit

class activityTableViewCell: UITableViewCell {
    @IBOutlet weak var activityImg:UIImageView!
    @IBOutlet weak var TitleLbl:UILabel!
    @IBOutlet weak var subtitleLbl:UILabel!
    @IBOutlet weak var timeLbl:UILabel!
    
    @IBOutlet weak var circleView:UIView!
    @IBOutlet weak var circle1View:UIView!
    @IBOutlet var starImg:[UIImageView]!
    @IBOutlet weak var buttonSelect: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}
