//
//  MyCouponsListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class MyCouponsListViewModel {
    
    public var myCouponsViewModel: [MyCouponsViewModel] = [MyCouponsViewModel]()
    private var myCouponsModel: MyCouponsModel
    
    init(couponsModel: MyCouponsModel){
        self.myCouponsModel = couponsModel
        getMyCoupons()
    }
    
    private func getMyCoupons(){
        let coupons = self.myCouponsModel.getAllMyCoupons()
        self.myCouponsViewModel = coupons.map{ item in
            return MyCouponsViewModel(myCoupons: item)
        }
    }
    
}
