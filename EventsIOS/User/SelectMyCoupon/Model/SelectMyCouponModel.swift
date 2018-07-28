//
//  SelectMyCouponModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class SelectMyCouponModel {
    
    public var listMySelectetCoupons: [Coupons] = [Coupons]()
    public func getAllMySelectCoupons() -> [Coupons] {
        listMySelectetCoupons.append( Coupons(image: "food-enchiladas", title: "2X1 Lasaña", expiration: "27/07/18", description: "En la compra de una laseña grande, te llevas la segunda gratis", business: "CocaCola"))
        listMySelectetCoupons.append( Coupons(image: "food-huacamole", title: "Refresco pareja", expiration: "15/08/18", description: "Si llevas a un acompañante te regalamos otra bedida", business: "CocaCola"))
        listMySelectetCoupons.append( Coupons(image: "food-manchamantel", title: "Lunes de Helado", expiration: "19/11/18", description: "Llevate un helado de sabor chocolate con un 10% de descuento", business: "CocaCola"))
        return listMySelectetCoupons
    }
    
    
    
}
