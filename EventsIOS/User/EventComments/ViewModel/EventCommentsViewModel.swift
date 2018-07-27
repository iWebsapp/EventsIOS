//
//  EventCommentsViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class EventCommentsViewModel {
    
    public var comment: String!
    public var user: String!
    public var date: String!
    public var avatar: String!
    
    init(comments: Comments){
        self.comment = comments.comment
        self.user = comments.user
        self.date = comments.date
        self.avatar = comments.avatar
    }
    
}
