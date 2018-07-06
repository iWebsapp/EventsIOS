//
//  DesignableButton.swift
//  EventsIOS
//
//  Created by Luis Castillo on 06/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

@IBDesignable class DesignableButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = self.cornerRadius
            layer.masksToBounds = self.cornerRadius > 0
        }
    }
    
}
