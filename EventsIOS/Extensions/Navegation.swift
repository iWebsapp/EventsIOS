//
//  NavegationController.swift
//  Sanus
//
//  Created by luis on 03/03/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class Navegation: UINavigationController {
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        self.startNav()
    }
    
    public func isLogin() ->Bool {
        if KeychainWrapper.standard.string(forKey: "token") == nil {
            return false
        } else {
            return true
        }
    }
    
    public func setStory(name: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: name)
        print(viewController)
        self.present(viewController, animated: true)
    }
    
    public func startNav() {
        
        if isLogin() {
            setStory(name: "loginTrue")
        } else {
            setStory(name: "loginFalse")
        }
        
    }


    
}
