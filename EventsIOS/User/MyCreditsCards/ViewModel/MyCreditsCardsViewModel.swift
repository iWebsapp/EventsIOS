//
//  MyCreditsCardsViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class MyCreditsCardsViewModel {
    
    public var number: String!
    public var mmaa: String!
    public var fullname: String!
    
    init(myCreditCard: CreditCard){
        self.number = myCreditCard.number
        self.mmaa = myCreditCard.mmaa
        self.fullname = myCreditCard.fullname
    }
    
}
