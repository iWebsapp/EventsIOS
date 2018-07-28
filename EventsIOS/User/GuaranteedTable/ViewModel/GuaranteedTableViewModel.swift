//
//  GuaranteedTableViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class GuaranteedTableViewModel{
    
    public var icon: String!
    public var title: String!
    
    init(guaranteedTable: GuaranteedTable){
        self.icon = guaranteedTable.icon
        self.title = guaranteedTable.title
    }
    
}
