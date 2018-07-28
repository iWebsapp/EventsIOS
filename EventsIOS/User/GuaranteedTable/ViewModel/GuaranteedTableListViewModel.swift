//
//  GuaranteedTableListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class GuaranteedTableListViewModel {
    
    public var guarantedViewModel: [GuaranteedTableViewModel] = [GuaranteedTableViewModel]()
    private var guarantedModel: GuaranteedTableModel
    
    init(guarantedModel: GuaranteedTableModel){
        self.guarantedModel = guarantedModel
        getAllGuarantedTable()
    }
    
    func getAllGuarantedTable(){
        let guaranted = self.guarantedModel.getAllGuaranteedTable()
        self.guarantedViewModel = guaranted.map { item in
            return GuaranteedTableViewModel(guaranteedTable: item)
        }
    }
    
}
