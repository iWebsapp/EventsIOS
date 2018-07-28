//
//  NewGuaranteedTableViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class NewGuaranteedTableViewModel {
    
    public var icon: String!
    public var title: String!
    
    init(newGuaranteed: GuaranteedTable){
        self.icon = newGuaranteed.icon
        self.title = newGuaranteed.title
    }
    
}

