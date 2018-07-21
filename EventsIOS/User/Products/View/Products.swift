//
//  Products.swift
//  EventsIOS
//
//  Created by Luis Castillo on 20/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class Products {
    
    public var name: String
    public var picture: String
    public var price: String
    public var description:String
    
    init(name: String, picture: String, price: String, description:String){
        self.name = name
        self.picture = picture
        self.price = price
        self.description = description
    }
    
}
