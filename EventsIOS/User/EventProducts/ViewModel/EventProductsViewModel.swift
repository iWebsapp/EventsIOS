//
//  EventProductsViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class EventProductsViewModel {
    
    public var name: String!
    public var image: String!
    public var price: String!
    public var description: String!
    
    init(products: ProductsEvent){
        self.name = products.name
        self.image = products.image
        self.price = products.price
        self.description = products.description
    }
    
}
