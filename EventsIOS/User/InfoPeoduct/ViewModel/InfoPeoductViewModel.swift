//
//  InfoPeoductViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class InfoPeoductViewModel {
    
    public var images: [String]!
    public var title: String!
    public var description: String!
    
    init(infoProduct: InfoPeoduct){
        self.images = infoProduct.images
        self.title = infoProduct.title
        self.description = infoProduct.description
    }
    
}
