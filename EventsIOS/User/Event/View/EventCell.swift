//
//  EventCell.swift
//  EventsIOS
//
//  Created by Luis Castillo on 07/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var avatar: DesignableImage!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
