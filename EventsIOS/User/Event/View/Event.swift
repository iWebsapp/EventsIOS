//
//  Event.swift
//  EventsIOS
//
//  Created by Luis Castillo on 07/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class Event {
    
    public var name: String
    public var date: String
    public var avatar: String
    
    init(name: String, date: String, avatar: String){
        self.name = name
        self.date = date
        self.avatar = avatar
    }
    
}
