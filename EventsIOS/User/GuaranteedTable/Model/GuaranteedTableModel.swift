//
//  GuaranteedTableModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class GuaranteedTableModel {
    
    public var listGuaranteed: [GuaranteedTable] = [GuaranteedTable]()
    public func getAllGuaranteedTable() -> [GuaranteedTable] {
        listGuaranteed.append( GuaranteedTable(icon: "icon-coupons", title: "Area de fumadores"))
        listGuaranteed.append( GuaranteedTable(icon: "icon-coupons", title: "Barra"))
        listGuaranteed.append( GuaranteedTable(icon: "icon-coupons", title: "Mesa"))
        return listGuaranteed
    }
    
}
