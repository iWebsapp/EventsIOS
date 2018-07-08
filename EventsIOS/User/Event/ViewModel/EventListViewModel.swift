//
//  EventListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 07/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class EventListViewModel {
    
    public  var eventViewModel: [EventViewModel] = [EventViewModel]()
    private var eventModel: EventModel
    
    init(eventModel: EventModel){
        self.eventModel = eventModel
        getAllEvents()
    }
    
    private func getAllEvents(){
        let event = self.eventModel.getAllEvents()
        self.eventViewModel = event.map{ even in
            return EventViewModel(data: even)
        }
    }
    
}
