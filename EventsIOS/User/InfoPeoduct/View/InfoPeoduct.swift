//
//  InfoPeoduct.swift
//  EventsIOS
//
//  Created by Luis Castillo on 21/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class InfoPeoduct {
    
    public var images: [String]
    public var title: String
    public var description: String
    
    init(images: [String], title: String, description: String){
        self.images = images
        self.title = title
        self.description = description
    }
    
}
