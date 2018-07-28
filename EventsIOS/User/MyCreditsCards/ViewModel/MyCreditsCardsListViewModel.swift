//
//  MyCreditsCardsListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class MyCreditsCardsListViewModel {
    
    public var mycardViewModel: [MyCreditsCardsViewModel] = [MyCreditsCardsViewModel]()
    private var mycardModel: MyCreditsCardsModel
    
    init(mycards: MyCreditsCardsModel){
        self.mycardModel = mycards
        getAllMyCards()
    }
    
    private func getAllMyCards(){
        let cards = self.mycardModel.getAllMyCards()
        self.mycardViewModel = cards.map{ item in
            return MyCreditsCardsViewModel(myCreditCard: item)
        }
    }
    
}
