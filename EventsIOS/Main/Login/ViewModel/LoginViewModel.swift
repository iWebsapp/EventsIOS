//
//  LoginViewModel.swift
//  EventsIOS-Debug
//
//  Created by Luis Castillo on 29/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class LoginViewModel: ViewModel {
    
    var brokenRules: [BrokenRule] = [BrokenRule]()
    var email: String!
    var password: String!
    var isValid: Bool {
        get {
            self.brokenRules = [BrokenRule]()
            self.validate()
            return self.brokenRules.count == 0 ? true : false        }
    }
    
}
