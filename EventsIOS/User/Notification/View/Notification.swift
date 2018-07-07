//
//  Notification.swift
//  EventsIOS
//
//  Created by Luis Castillo on 07/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class Notification{
    
    public var avatar: String
    public var date: String
    public var user: String
    public var description: String
    
    init(avatar: String, date: String, user: String, description: String) {
        self.avatar = avatar
        self.date = date
        self.user = user
        self.description = description
    }
    
}
