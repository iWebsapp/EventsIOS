//
//  InfoCardShopping.swift
//  EventsIOS
//
//  Created by Luis Castillo on 20/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class InfoCardShopping {
    
    public var name: String
    public var picture: String
    public var open: Bool
    public var total: String
    public var products: [Products]
    
    init(name: String, picture: String, open: Bool, total: String, products: [Products]){
        self.name = name
        self.picture = picture
        self.open = open
        self.total = total
        self.products = products
    }
    
}
