//
//  NotificationViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 07/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class NotificationViewModel{
    
    public var avatar: String
    public var date: String
    public var user: String
    public var description: String
    
    init(data: Notification) {
        self.avatar = data.avatar
        self.date = data.date
        self.user = data.user
        self.description = data.description
    }
    
}
