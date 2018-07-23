//
//  ProfileEventModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 10/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class ProfileEventModel{
    
    public var itemsProfile = [ProfileEvent]()
    
    public func getAllProfileItems() -> [ProfileEvent] {
        itemsProfile.append( ProfileEvent(icon: "icon-info", title: "Información") )
        itemsProfile.append( ProfileEvent(icon: "icon-comments", title: "Comentarios") )
        itemsProfile.append( ProfileEvent(icon: "icon-coupons", title: "Cupones") )
        itemsProfile.append( ProfileEvent(icon: "icon-promotions", title: "Promociones") )
        itemsProfile.append( ProfileEvent(icon: "icon-products", title: "Productos") )
        itemsProfile.append( ProfileEvent(icon: "icon-table-food", title: "Mesa garantizada") )
        return itemsProfile
    }
    
}
