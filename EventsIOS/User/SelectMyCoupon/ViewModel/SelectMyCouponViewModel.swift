//
//  SelectMyCouponViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class SelectMyCouponViewModel {
    
    public var image: String!
    public var title: String!
    public var expiration: String!
    public var description: String!
    public var business: String!
    
    init(selectMyCoupons: Coupons){
        self.image = selectMyCoupons.image
        self.title = selectMyCoupons.title
        self.expiration = selectMyCoupons.expiration
        self.description = selectMyCoupons.description
        self.business = selectMyCoupons.business
    }
    
}
