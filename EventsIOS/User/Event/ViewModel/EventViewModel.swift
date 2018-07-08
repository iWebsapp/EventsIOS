//
//  EventViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 07/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class EventViewModel {
    
    public var name: String
    public var date: String
    public var avatar: String
    
    init(data: Event){
        self.name = data.name
        self.date = data.date
        self.avatar = data.avatar
    }
    
}
