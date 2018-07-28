//
//  ShoppingCartListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class ShoppingCartListViewModel {
    
    public var shopingViewModel: [ShoppingCartViewModel] = [ShoppingCartViewModel]()
    private var shopingModel: ShoppingCartModel
    
    init(shoppingModel: ShoppingCartModel){
        self.shopingModel = shoppingModel
        getAllShopingCart()
    }
    
    private func getAllShopingCart(){
        let shoping = self.shopingModel.getAllShopingCart()
        self.shopingViewModel = shoping.map{ item in
            return ShoppingCartViewModel(shoping: item)
        }
    }
    
}
