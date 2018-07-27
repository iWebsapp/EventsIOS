//
//  EventPromotionsModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class EventPromotionsModel {
    
    public var listPromotions:[PromotionsEvent] = [PromotionsEvent]()
    public func getAllPromotions() ->[PromotionsEvent] {
        listPromotions.append( PromotionsEvent(title: "El Tradicional Guacamole", description: "2x1", picture: "food-huacamole"))
        listPromotions.append( PromotionsEvent(title: "Sopa de Tortilla", description: "Refresco gratis", picture: "food-sopa-tortila"))
        listPromotions.append( PromotionsEvent(title: "Pechuga con Mole Poblano", description: "15% de descuento", picture: "food-mole"))
        listPromotions.append( PromotionsEvent(title: "Tacos Dorados de Pollo", description: "Viernes al 2X1", picture: "food-tacos"))
        return listPromotions
    }
    
}
