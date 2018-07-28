//
//  InfoCardShoppingViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class InfoCardShoppingViewModel {
    
    public var name: String!
    public var picture: String!
    public var open: Bool!
    public var total: String!
    public var products: [Products]!
    
    init(infoCard:InfoCardShopping){
        self.name = infoCard.name
        self.picture = infoCard.picture
        self.open = infoCard.open
        self.total = infoCard.total
        self.products = infoCard.products
    }
    
}
