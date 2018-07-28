//
//  InfoCardShoppingListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class InfoCardShoppingListViewModel {
    
    public var infoCardViewModel: [InfoCardShoppingViewModel] = [InfoCardShoppingViewModel]()
    private var  infoCardModel: InfoCardShoppingModel
    
    init(infoCardModel:InfoCardShoppingModel){
        self.infoCardModel = infoCardModel
        getAllInfoCards()
    }
    
    private func getAllInfoCards(){
        let infoCards = self.infoCardModel.getAllInfoShopping()
        self.infoCardViewModel = infoCards.map{ item in
            return InfoCardShoppingViewModel(infoCard: item )
        }
    }
    
}
