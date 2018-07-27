//
//  EventCouponsViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class EventCouponsViewModel {
    
    public var image: String!
    public var title: String!
    public var expiration: String!
    public var description: String!
    public var business: String!
    
    init(coupons: Coupons){
        self.image = coupons.image
        self.title = coupons.title
        self.expiration = coupons.expiration
        self.description = coupons.description
        self.business = coupons.business
    }
    
}
