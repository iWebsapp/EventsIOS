//
//  Help.swift
//  EventsIOS
//
//  Created by Luis Castillo on 18/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class Help {
    
    public var open: Bool
    public var question: String
    public var answer: [String]
    
    init(open: Bool, question: String, answer: [String]){
        self.open = open
        self.question = question
        self.answer = answer
    }
    
}
