//
//  NewGuaranteedTableListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class NewGuaranteedTableListViewModel {
    
    public var newGuaranteedViewModel: [NewGuaranteedTableViewModel] = [NewGuaranteedTableViewModel]()
    private var newGuaranteedModel: NewGuaranteedTableModel
    
    init(newGuaranteedModel: NewGuaranteedTableModel){
        self.newGuaranteedModel = newGuaranteedModel
        getAllNewGuaranteed()
    }
    
    private func getAllNewGuaranteed(){
        let guaranteed = self.newGuaranteedModel.listNewGuaranteed()
        self.newGuaranteedViewModel = guaranteed.map{ item in
            return NewGuaranteedTableViewModel(newGuaranteed: item)
        }
    }
    
}

