//
//  Token.swift
//  EventsIOS-Debug
//
//  Created by Luis Castillo on 29/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

extension UIViewController {
    
    func setToken( data:String ) ->Bool {
        let token: Bool = KeychainWrapper.standard.set(data, forKey: "token")
        return token
    }
    
    func getToken() -> String {
        return KeychainWrapper.standard.string(forKey: "token")!
    }
    
    func deleteToken() ->Bool {
        let remove: Bool = KeychainWrapper.standard.removeObject(forKey: "token")
        return remove
    }
    
}
