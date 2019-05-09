//
//  RecommendTableViewCell.swift
//  KSLife
//
//  Created by uareagay on 2019/4/28.
//  Copyright © 2019 cn.edu.twt. All rights reserved.
//

import UIKit

class RecommendTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var popularLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLable.text = "即苦涩ewfrdew  eswh饿死就那个 v 健康 索达吉堪布女孩 v 会计师的人就看能否改变 v 健康热水能看见的人说的话不热"
        titleLable.sizeToFit()
        let a = titleLable.sizeThatFits(CGSize(width: 0, height: CGFloat.greatestFiniteMagnitude))
        print(a)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
