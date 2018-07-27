//
//  EventPromotionsViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class EventPromotionsViewModel {
    
    public var title: String!
    public var description: String!
    public var picture: String!
    
    init(promotions: PromotionsEvent){
        self.title = promotions.title
        self.description = promotions.description
        self.picture = promotions.picture
    }
    
}
