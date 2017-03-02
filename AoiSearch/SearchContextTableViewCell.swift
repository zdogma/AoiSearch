//
//  SearchContextTableViewCell.swift
//  AoiSearch
//
//  Created by Tomohiro Zoda on 2017/03/02.
//  Copyright © 2017年 Tomohiro Zoda. All rights reserved.
//

import Kingfisher
import UIKit

class SearchContextTableViewCell: UITableViewCell {

    @IBOutlet weak var searchContextThumbnailImageView: UIImageView!
    @IBOutlet weak var searchContextTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func apply(searchContext: SearchContext) {
        searchContextTitleLabel.text = searchContext.title

        let placeholderImage = #imageLiteral(resourceName: "SearchContextIcon")
        if let imageUrl = URL(string: searchContext.iconUrl) {
            searchContextThumbnailImageView.kf.setImage(with: imageUrl, placeholder: placeholderImage)
        } else {
            searchContextThumbnailImageView.image = placeholderImage
        }
    }
}
