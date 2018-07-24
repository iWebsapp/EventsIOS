//
//  NewGuaranteedTableCell.swift
//  EventsIOS
//
//  Created by Luis Castillo on 23/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class NewGuaranteedTableCell: UITableViewCell {
    
    @IBOutlet weak var txtIcon: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtSelected: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
