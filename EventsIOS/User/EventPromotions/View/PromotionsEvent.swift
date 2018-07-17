//
//  PromotionsEventModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 12/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class PromotionsEvent{
    
    public var title: String
    public var description: String
    public var picture: String
    
    init(title: String, description: String, picture: String){
        self.title = title
        self.description = description
        self.picture = picture
    }
    
}
