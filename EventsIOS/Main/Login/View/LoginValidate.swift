//
//  LoginValidate.swift
//  EventsIOS-Debug
//
//  Created by Luis Castillo on 30/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation
import UIKit

struct BrokenRule {
    var propertyName: String
    var messege: String
}

protocol ViewModel {
    var brokenRules: [BrokenRule] { get set }
    var isValid: Bool { mutating get }
}

extension LoginViewModel {
    
    public func validate(){
        
        if (email.isEmpty){
            self.brokenRules.append( BrokenRule(propertyName: "email", messege: "email is required"))
        } else {
            let isEmail = self.isValidEmailAddress(emailAddressString: email!)
            if !isEmail {
                self.brokenRules.append( BrokenRule(propertyName: "password", messege: "email is not valid"))
            }
        }
        if (password.isEmpty) {
            self.brokenRules.append( BrokenRule(propertyName: "password", messege: "password is required"))
        } else {
            if (password.count > 8) {
                self.brokenRules.append( BrokenRule(propertyName: "password", messege: "this password requires at least 8 characters"))
            }
        }
    }
    
    private func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0{
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
}
