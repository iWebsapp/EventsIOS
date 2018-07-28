//
//  ShoppingCartViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class ShoppingCartViewModel {
    
    public var picture: String!
    public var name: String!
    public var pieces: String!
    
    init(shoping: Shopping){
        self.picture = shoping.picture
        self.name = shoping.name
        self.pieces = shoping.pieces
    }
    
}
