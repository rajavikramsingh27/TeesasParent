//
//  DetailsFullTableViewCell.swift
//  TeesasParent
//
//  Created by iOS-Appentus on 25/March/2020.
//  Copyright © 2020 appentus. All rights reserved.
//

import UIKit

class DetailsFullTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var subtitleLbl:UILabel!
    @IBOutlet weak var percentLbl:UILabel!
    @IBOutlet weak var percentImg:UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        percentImg.image = selectedDetailsImg
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
