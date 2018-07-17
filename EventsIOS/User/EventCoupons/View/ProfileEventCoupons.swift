//
//  ProfileEventCoupons.swift
//  EventsIOS
//
//  Created by Luis Castillo on 12/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class ProfileEventCoupons{
    
    public var title: String
    public var description: String
    public var expiration: String
    
    init(title: String, description: String, expiration: String){
        self.title = title
        self.description = description
        self.expiration = expiration
    }
    
}
