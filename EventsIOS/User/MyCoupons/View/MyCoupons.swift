//
//  MyCoupons.swift
//  EventsIOS
//
//  Created by Luis Castillo on 17/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class MyCoupons {
    
    public var image: String
    public var title: String
    public var expiration: String
    public var description: String
    
    init(image: String, title: String, expiration: String, description: String){
        self.image = image
        self.title = title
        self.expiration = expiration
        self.description = description
    }
    
}
