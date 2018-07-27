//
//  HelpListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class HelpListViewModel {
    
    public var helpViewModel: [HelpViewModel] = [HelpViewModel]()
    private var helpModel: HelpModel
    
    init(helpModel: HelpModel){
        self.helpModel = helpModel
        getHelps()
    }
    
    private func getHelps(){
        let help = self.helpModel.getAllHelps()
        self.helpViewModel = help.map{ item in
            return HelpViewModel(help: item)
        }
    }
    
}
