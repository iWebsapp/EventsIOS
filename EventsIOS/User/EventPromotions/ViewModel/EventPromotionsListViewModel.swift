//
//  EventPromotionsListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class EventPromotionsListViewModel {
    
    public var eventPromotionsViewModel: [EventPromotionsViewModel] = [EventPromotionsViewModel]()
    private var eventPromotionsModel: EventPromotionsModel
    
    init(eventPromotions: EventPromotionsModel){
        self.eventPromotionsModel = eventPromotions
        getAllPromotions()
    }
    
    private func getAllPromotions(){
        let promotions = self.eventPromotionsModel.getAllPromotions()
        self.eventPromotionsViewModel = promotions.map{ item in
            return EventPromotionsViewModel(promotions: item)
        }
    }
    
}
