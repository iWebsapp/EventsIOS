//
//  Alerts.swift
//  EventsIOS-Debug
//
//  Created by Luis Castillo on 29/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alertSimple( this: UIViewController, titileAlert: String?, bodyAlert: String?, complete: @escaping ((String) -> Void)) {
        let alert = UIAlertController(title: titileAlert, message: bodyAlert, preferredStyle: .alert)
        let acept = UIAlertAction(title: "Aceptar", style: .default, handler: { (action) in
            complete("acept")
        })
        alert.addAction(acept)
        this.present(alert, animated: true, completion: nil)
    }
    
    func alertAvanced( this: UIViewController, titileAlert: String?, bodyAlert: String?, complete: @escaping ((String) -> Void)) {
        let alert = UIAlertController(title: titileAlert, message: bodyAlert, preferredStyle: .alert)
        let acept = UIAlertAction(title: "Aceptar", style: .default, handler: { (action) in
            complete("acept")
        })
        let cancel = UIAlertAction(title: "Cancelar", style: .default, handler: { (action) in
            complete("cancel")
        })
        alert.addAction(acept)
        alert.addAction(cancel)
        this.present(alert, animated: true, completion: nil)
    }
    
    func hendlerError( this: UIViewController, complete: @escaping ((String) -> Void)) {
        let alert = UIAlertController(title: "Se ha producido un error", message: "Intentalo más tarde", preferredStyle: .alert)
        let acept = UIAlertAction(title: "Aceptar", style: .default, handler: { (action) in
            complete("acept")
        })
        alert.addAction(acept)
        this.present(alert, animated: true, completion: nil)
    }
    
}
