//
//  webservice.swift
//  EventsIOS-Debug
//
//  Created by Luis Castillo on 29/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire



enum Path {
    case login
}

class Webservice {
    
    public let url: String = "\(ProcessInfo.processInfo.environment["web_service"]!)"
    
    func methods( m: Method ) -> HTTPMethod {
        switch m {
        case .GET:
            return .get
        case .POST:
            return .post
        case .PUT:
            return .put
        case .DELETE:
            return .delete
        }
    }
    
    func path( p: Path ) -> String {
        switch p {
        case .login:
            return "users/login"
        }
    }
    
    func restApi(params:Parameters, method:Method, action:Path, complete: @escaping ((Any) -> Void)) {
        let URL = self.url + self.path(p: action)
        Alamofire.request(URL, method: self.methods(m: method), parameters: params).responseJSON { (resp) in
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
