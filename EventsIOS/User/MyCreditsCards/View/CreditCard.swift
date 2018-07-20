//
//  CreditCard.swift
//  EventsIOS
//
//  Created by Luis Castillo on 19/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class CreditCard {
    
    public var number: String
    public var mmaa: String
    public var fullname: String
    
    init(number: String, mmaa: String, fullname: String){
        self.number = number
        self.mmaa = mmaa
        self.fullname = fullname
    }
    
}
