//
//  HelpListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class HelpListViewModel {
    
    private var helpModel: HelpModel = HelpModel()
    
    func getHelps( onSuccess: @escaping( [Help] ) -> Void){
        self.helpModel.getAllHelps(complete: { help in
            onSuccess(help)
        })
    }
    
}
