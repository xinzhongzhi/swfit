//
//  CustomTableViewCell.swift
//  funsArea - swfit
//
//  Created by 辛忠志 on 2018/1/12.
//  Copyright © 2018年 xinzhongzhi. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    /*头像*/
    @IBOutlet weak var headImageView: UIImageView!
    /*上*/
    @IBOutlet weak var nameLabel: UILabel!
    /*下*/
    @IBOutlet weak var detailLabel: UILabel!
    /*中*/
    @IBOutlet weak var fontLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headImageView.layer.cornerRadius = headImageView.frame.size.height/2
        headImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
