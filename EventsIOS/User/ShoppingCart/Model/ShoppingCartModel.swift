//
//  ShoppingCartModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class ShoppingCartModel {
    
    public var listShopingCart: [Shopping] = [Shopping]()
    
    public func getAllShopingCart() ->[Shopping] {
        listShopingCart.append( Shopping(picture: "food-enchiladas", name: "Este es el producto numero 1", pieces: "1"))
        listShopingCart.append( Shopping(picture: "food-enchiladas", name: "Este es el producto numero 2", pieces: "1"))
        listShopingCart.append( Shopping(picture: "food-enchiladas", name: "Este es el producto numero 3", pieces: "1"))
        listShopingCart.append( Shopping(picture: "food-enchiladas", name: "Este es el producto numero 4", pieces: "1"))
        listShopingCart.append( Shopping(picture: "food-enchiladas", name: "Este es el producto numero 5", pieces: "1"))
        listShopingCart.append( Shopping(picture: "food-enchiladas", name: "Este es el producto numero 6", pieces: "1"))
        return listShopingCart
    }
    
}
