//
//  File.swift
//  EventsIOS
//
//  Created by Luis Castillo on 10/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class ProfileEventListViewModel {
    
    public var profileEventViewModel: [ProfileEventViewModel] = [ProfileEventViewModel]()
    private var dataEvent: ProfileEventModel
    
    init(data:ProfileEventModel){
        self.dataEvent = data
        getAllItemsProfileEvent()
    }
    
    private func getAllItemsProfileEvent(){
        let profileEvent = self.dataEvent.getAllProfileItems()
        self.profileEventViewModel = profileEvent.map{ items in
            return ProfileEventViewModel(data: items)
        }
    }
    
}
