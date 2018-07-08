//
//  EventModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 07/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation


class EventModel {
    
    private var events: [Event] = [Event]()
    
    public func getAllEvents() -> [Event] {
        events.append( Event(name: "La fiesta de luis", date: "27/03/18", avatar: "2.jpg"))
        events.append( Event(name: "La fiesta de riquis", date: "14/06/18", avatar: "2.jpg"))
        events.append( Event(name: "La fiesta de jim", date: "27/03/18", avatar: "3.jpg"))
        return events
    }
    
}
