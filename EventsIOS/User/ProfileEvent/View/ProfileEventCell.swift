//
//  ProfileEventCell.swift
//  EventsIOS
//
//  Created by Luis Castillo on 10/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ProfileEventCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var cardView: DesignableGradient!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
