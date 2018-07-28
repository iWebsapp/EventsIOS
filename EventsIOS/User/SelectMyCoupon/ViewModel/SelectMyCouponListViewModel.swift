//
//  SelectMyCouponListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class SelectMyCouponListViewModel{
    
    public var selectMyCouponsViewModel: [SelectMyCouponViewModel] = [SelectMyCouponViewModel]()
    private var selectMyCouponsModel: SelectMyCouponModel
    
    init(selectMyCoupons: SelectMyCouponModel){
        self.selectMyCouponsModel = selectMyCoupons
        getAllSelectMyCoupons()
    }
    
    private func getAllSelectMyCoupons(){
        let selectedCoupons = self.selectMyCouponsModel.getAllMySelectCoupons()
        self.selectMyCouponsViewModel = selectedCoupons.map{ item in
            return SelectMyCouponViewModel(selectMyCoupons: item)
        }
    }
    
}
