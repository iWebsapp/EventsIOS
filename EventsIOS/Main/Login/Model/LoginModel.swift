//
//  LoginModel.swift
//  EventsIOS-Debug
//
//  Created by Luis Castillo on 29/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class LoginModel {
    
    private var URL: String = ""
    private let api = Webservice()
    

    func loginWS(params:Parameters, method:Method, action:Path, complete: @escaping ((Any) -> Void)) {
        self.URL = self.api.url + self.api.path(p: action)
        Alamofire.request(self.URL, method: self.api.methods(m: method), parameters: params).responseJSON { (resp) in
            switch resp.result {
                case .success(let value):
                    let data = JSON(value)
                    complete(data)
                case .failure(let error):
                    let err = "\(error)"
                    complete(err)
                    print("error: ", error.localizedDescription)
            }
        }
    }

}

