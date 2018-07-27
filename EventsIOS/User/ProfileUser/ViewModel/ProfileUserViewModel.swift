//
//  ProfileUserViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 26/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class ProfileUserViewModel {
    
    public var icon: String!
    public var title: String!
    
    init(itemsProfile: ProfileEvent){
        self.icon = itemsProfile.icon
        self.title = itemsProfile.title
    }
}
