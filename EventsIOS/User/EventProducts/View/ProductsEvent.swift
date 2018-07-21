//
//  ProductsEvent.swift
//  EventsIOS
//
//  Created by Luis Castillo on 11/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class ProductsEvent {
    
    public var name: String
    public var image: String
    public var price: String
    public var description: String
    
    init(name: String, image: String, price: String, description: String){
        self.name = name
        self.image = image
        self.price = price
        self.description = description
    }
    
}
