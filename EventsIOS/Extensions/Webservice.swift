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

class Webservice: UIViewController {
    
    private let url: String = "\(ProcessInfo.processInfo.environment["web_service"]!)"
    private var header = ["Authorization": ""]
    
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
            case .create:
                return "users/create"
            case .privacy:
                return "privacy/all"
            case .abouts:
                return "abouts/all"
            case .changeEmail:
                return "users/change/email"
            case .changePassword:
                return "users/change/password"
            case .changeBirthday:
                return "users/change/birthday"
            case .help:
                return "help/all"
        }
    }
    
    //HTTPHeaders
    
    func restApi(params:Parameters, method:Method, action:Path, complete: @escaping ((Any) -> Void)) {
        let URL = self.url + self.path(p: action)
        if self.isLoginToken() {
            header = ["Authorization": self.getToken()]
        }
        Alamofire.request(URL, method: self.methods(m: method), parameters: params, headers: header ).responseJSON { (resp) in
            switch resp.result {
            case .success(let value):
                let data = JSON(value)
                complete(data)
            case .failure(let error):
                let err = "\(error.localizedDescription)"
                complete(err)
            }
        }
    }
    
    
    func restApi( method:Method, action:Path, complete: @escaping ((Any) -> Void)) {
        let URL = self.url + self.path(p: action)
        if self.isLoginToken() {
            header = ["Authorization": self.getToken()]
        }
        Alamofire.request(URL, method: self.methods(m: method), headers: header ).responseJSON { (resp) in
            switch resp.result {
            case .success(let value):
                let data = JSON(value)
                complete(data)
            case .failure(let error):
                let err = "\(error.localizedDescription)"
                complete(err)
            }
        }
    }

    
}
