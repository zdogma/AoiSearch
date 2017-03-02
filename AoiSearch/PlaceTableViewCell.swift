//
//  PlaceTableViewCell.swift
//  AoiSearch
//
//  Created by Tomohiro Zoda on 2017/03/02.
//  Copyright © 2017年 Tomohiro Zoda. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var placeTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func apply(place: Place) {
        placeTitleLabel.text = place.title
    }
}
