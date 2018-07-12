//
//  ProfileEventViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 10/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class ProfileEventViewModel{
    
    public var icon: String!
    public var title: String!
    
    init(data:ProfileEvent){
        self.icon = data.icon
        self.title = data.title
    }
}


