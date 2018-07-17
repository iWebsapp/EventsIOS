//
//  ProfileEventProductsCell.swift
//  EventsIOS
//
//  Created by Luis Castillo on 11/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ProfileEventProductsCell: UITableViewCell {

    @IBOutlet weak var pictureProduct: UIImageView!
    @IBOutlet weak var txtTitleProduct: UILabel!
    @IBOutlet weak var txtCategorieProduct: UILabel!
    @IBOutlet weak var txtPriceProduct: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
