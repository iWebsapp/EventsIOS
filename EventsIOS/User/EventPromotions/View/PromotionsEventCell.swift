//
//  PromotionsEventCell.swift
//  EventsIOS
//
//  Created by Luis Castillo on 12/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class PromotionsEventCell: UITableViewCell {

    @IBOutlet weak var picturePromotions: DesignableImage!
    @IBOutlet weak var titlePromotions: UILabel!
    @IBOutlet weak var descriptionPromotions: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
