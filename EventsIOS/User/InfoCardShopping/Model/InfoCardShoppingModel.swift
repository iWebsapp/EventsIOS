//
//  InfoCardShoppingModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class InfoCardShoppingModel {
    
    public var listCardShopping: [InfoCardShopping] = [InfoCardShopping]()
    public func getAllInfoShopping() -> [InfoCardShopping] {
        listCardShopping.append( InfoCardShopping(name: "Fecha 1", picture: "food-mole", open: false, total: "$127.00 mxn",
                        products: [Products(name: "Producto 1", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 1"),
                                   Products(name: "Producto 2", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 2"),
                                   Products(name: "Producto 3", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 3"),
                                   Products(name: "Producto 4", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 4")]))
        
        listCardShopping.append( InfoCardShopping(name: "Fecha 2", picture: "food-mole", open: false, total: "$127.00 mxn",
                        products: [Products(name: "Producto 5", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 5"),
                                   Products(name: "Producto 6", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 6"),
                                   Products(name: "Producto 7", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 7"),
                                   Products(name: "Producto 8", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 8")]))
        
        listCardShopping.append( InfoCardShopping(name: "Fecha 3", picture: "food-mole", open: false, total: "$127.00 mxn",
                        products: [Products(name: "Producto 9", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 9"),
                                   Products(name: "Producto 10", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 10"),
                                   Products(name: "Producto 11", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 11"),
                                   Products(name: "Producto 12", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 12")]))
        return listCardShopping
    }
    
    
}
