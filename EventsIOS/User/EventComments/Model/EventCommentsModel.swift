//
//  EventCommentsModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation


class EventCommentsModel {
    
    public var listComments: [Comments] = [Comments]()
    
    public func getAllComments() ->[Comments] {
        listComments.append( Comments(comment: "Mensaje 1", user: "Luis Castillo", date: "27/03/18", avatar: "avatar") )
        listComments.append( Comments(comment: "Mensaje 2", user: "Mireyitha Jim", date: "15/03/18", avatar: "avatar") )
        listComments.append( Comments(comment: "Mensaje 3", user: "Rott Castillo", date: "10/03/18", avatar: "avatar") )
        listComments.append( Comments(comment: "Mensaje 4", user: "Suly Castillo", date: "19/10/18", avatar: "avatar") )
        return listComments
    }
    
}
