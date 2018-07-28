//
//  InfoPeoductListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class InfoPeoductListViewModel {
    
    public var infoProductViewModel: [InfoPeoductViewModel] = [InfoPeoductViewModel]()
    private var infoProductModel: InfoPeoductModel
    
    init(producModel:InfoPeoductModel){
       self.infoProductModel = producModel
        getAllInfoProduct()
    }
    
    private func getAllInfoProduct(){
        let infoProducts = self.infoProductModel.getAllInfoProducts()
        self.infoProductViewModel = infoProducts.map{ item in
            return InfoPeoductViewModel(infoProduct: item)
        }
    }
    
}
