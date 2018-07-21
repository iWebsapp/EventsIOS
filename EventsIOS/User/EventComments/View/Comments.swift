//
//  Comments.swift
//  EventsIOS
//
//  Created by Luis Castillo on 21/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class Comments {
    
    public var comment: String
    public var user: String
    public var date: String
    public var avatar: String
    
    init(comment: String, user: String, date: String, avatar: String){
        self.comment = comment
        self.user = user
        self.date = date
        self.avatar = avatar
    }
    
}
