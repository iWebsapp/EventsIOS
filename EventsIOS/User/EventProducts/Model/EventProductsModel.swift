//
//  EventProductsModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class EventProductsModel {
    
    public var listProduct: [ProductsEvent] = [ProductsEvent]()
    public func getAllProduct() ->[ProductsEvent] {
        listProduct.append( ProductsEvent(name: "Enchiladas Vips", image: "food-enchiladas", price: "27.00", description: ""))
        listProduct.append( ProductsEvent(name: "El Tradicional Guacamole", image: "food-huacamole",  price: "15.00", description: ""))
        listProduct.append( ProductsEvent(name: "Sopa de Tortilla", image: "food-sopa-tortila", price: "157.00", description: ""))
        listProduct.append( ProductsEvent(name: "Pechuga con Mole Poblano", image: "food-mole", price: "27.00", description: ""))
        listProduct.append( ProductsEvent(name: "Tacos Dorados de Pollo", image: "food-tacos", price: "127.00", description: ""))
        return listProduct
    }
    
    
}
