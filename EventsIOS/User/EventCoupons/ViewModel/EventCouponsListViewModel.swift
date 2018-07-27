//
//  EventCouponsListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class EventCouponsListViewModel {
    
    public var eventCouponsViewModel: [EventCouponsViewModel] = [EventCouponsViewModel]()
    private var eventCouponsModel: EventCouponsModel
    
    init(eventCoupons: EventCouponsModel){
        self.eventCouponsModel = eventCoupons
        getAllCoupons()
    }
    
    private func getAllCoupons(){
        let coupons = self.eventCouponsModel.getAllCoupons()
        self.eventCouponsViewModel = coupons.map{ item in
            return EventCouponsViewModel(coupons: item)
        }
    }
    
}
