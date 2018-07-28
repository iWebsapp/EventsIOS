//
//  MyCouponsViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class MyCouponsViewModel {
    
    public var image: String!
    public var title: String!
    public var expiration: String!
    public var description: String!
    public var business: String!
    
    init(myCoupons: Coupons){
        self.image = myCoupons.image
        self.title = myCoupons.title
        self.expiration = myCoupons.expiration
        self.description = myCoupons.description
        self.business = myCoupons.business
    }
    
}
