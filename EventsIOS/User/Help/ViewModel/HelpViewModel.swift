//
//  HelpViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class HelpViewModel {
    
    public var open: Bool!
    public var question: String!
    public var answer: [String]!
    
    init(help: Help){
        self.open = help.open
        self.question = help.question
        self.answer = help.answer
    }
    
}
