//
//  ProfileUserListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 26/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class ProfileUserListViewModel {
    
    public var itemsProfileUserModel: [ProfileUserViewModel] = [ProfileUserViewModel]()
    private var profileUserModel: ProfileUserModel
    
    init(profileUserModel: ProfileUserModel){
        self.profileUserModel = profileUserModel
        getAllItems()
    }
    
    private func getAllItems(){
        let items = self.profileUserModel.getItemsMenuProfile()
        self.itemsProfileUserModel = items.map{ item in
            return ProfileUserViewModel(itemsProfile: item)
        }
    }
    
}
