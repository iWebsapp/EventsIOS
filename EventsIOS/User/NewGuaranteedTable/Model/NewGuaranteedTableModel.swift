//
//  NewGuaranteedTableModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class NewGuaranteedTableModel {
    
    public var listGuaranteed: [GuaranteedTable] = [GuaranteedTable]()
    public func listNewGuaranteed() ->[GuaranteedTable] {
        listGuaranteed.append( GuaranteedTable(icon: "icon-coupons", title: "Area de fumadores"))
        listGuaranteed.append( GuaranteedTable(icon: "icon-coupons", title: "Barra"))
        listGuaranteed.append( GuaranteedTable(icon: "icon-coupons", title: "Mesa"))
        listGuaranteed.append( GuaranteedTable(icon: "icon-coupons", title: "Cerca de una ventana"))
        listGuaranteed.append( GuaranteedTable(icon: "icon-coupons", title: "Cerca de la cocina"))
        listGuaranteed.append( GuaranteedTable(icon: "icon-coupons", title: "Cerca de la salida"))
        return listGuaranteed
    }
    
    
}
