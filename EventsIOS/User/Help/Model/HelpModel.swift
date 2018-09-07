//
//  HelpModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation
import SwiftyJSON

class HelpModel {
    
    private let helpApi: Webservice = Webservice()
    
    func getAllHelps( complete: @escaping (([Help]) -> Void)) {
        var listHelps: [Help] = []
        helpApi.restApi(method: .GET, action: .help) { resp in
            let result = JSON(resp)
            if result["status"] == 200 {
                let conta = result["data"].count - 1
                for i in 0...conta {
                    let data = result["data"][i]
                    let quest:String = "\(data["cuestion"])"
                    let answe:String = "\(data["answer"][0])"
                    listHelps.append( Help(open: false, question: quest, answer: [answe]))
                }
                complete(listHelps)
            } else {
                complete(listHelps)
            }
        }
        
    }
    
    
}
