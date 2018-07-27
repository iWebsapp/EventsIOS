//
//  EventProductsListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class EventProductsListViewModel{
    
    public var eventProductViewModel: [EventProductsViewModel] = [EventProductsViewModel]()
    private var eventProductModel: EventProductsModel
    
    init(producModel: EventProductsModel){
        self.eventProductModel = producModel
        getProducts()
    }
    
    private func getProducts(){
        let products = self.eventProductModel.getAllProduct()
        self.eventProductViewModel = products.map{ item in
            return EventProductsViewModel(products: item)
        }
    }
    
}
