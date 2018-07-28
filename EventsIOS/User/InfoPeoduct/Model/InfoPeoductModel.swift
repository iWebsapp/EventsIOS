//
//  InfoPeoductModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class InfoPeoductModel {
    
    public var listInfoProduct: [InfoPeoduct] = [InfoPeoduct]()
    public func getAllInfoProducts() -> [InfoPeoduct] {
        listInfoProduct = [InfoPeoduct(images: ["food-enchiladas", "food-huacamole", "food-manchamantel", "food-mole", "food-nuggets"], title: "Producto 1", description: "Este es el producto 1")]
        return listInfoProduct
    }
    
}
