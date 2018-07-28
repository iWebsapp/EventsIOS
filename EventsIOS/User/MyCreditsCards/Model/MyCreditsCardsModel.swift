//
//  MyCreditsCardsModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class MyCreditsCardsModel {
    
    public var listMyCards: [CreditCard] = [CreditCard]()
    
    public func getAllMyCards() ->[CreditCard] {
        listMyCards.append( CreditCard(number: "1234 4321 1111 2715", mmaa: "27/21", fullname: "Luis Manuel Castillo Zamorano"))
        listMyCards.append( CreditCard(number: "1111 1234 4321 1527", mmaa: "27/21", fullname: "Ana Mireya Jimenez Perez"))
        listMyCards.append( CreditCard(number: "2222 1111 4444 6067", mmaa: "27/21", fullname: "Dolores Imelda Zamorano Lugo"))
        listMyCards.append( CreditCard(number: "4444 2222 1111 1270", mmaa: "27/21", fullname: "Yajaira Abigail Corriente Osorno"))
        return listMyCards
    }
    
}
