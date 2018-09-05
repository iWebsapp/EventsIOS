//
//  EditProfileController.swift
//  EventsIOS-Debug
//
//  Created by Luis Castillo on 04/09/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit
import SwiftyJSON

class EditProfileController: UIViewController {

    @IBOutlet weak var cardEmail: DesignableGradient!
    @IBOutlet weak var cardPassword: DesignableGradient!
    @IBOutlet weak var cardBirthday: DesignableGradient!
    
    @IBOutlet weak var txtNewEmail: UITextField!
    @IBOutlet weak var txtOldPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtBirthday: UIDatePicker!
    
    @IBOutlet weak var btnPassword: UIButton!
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var btnBirthday: UIButton!
    
    public var paramsSegue: String = ""
    
    private var editModel: Webservice!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.editModel = Webservice()
        self.paramsSegue = UserDefaults.standard.object(forKey: "setting") as! String
        
        cardEmail.isHidden = true
        cardPassword.isHidden = true
        cardBirthday.isHidden = true
        
        if self.paramsSegue == "email" {
            cardEmail.isHidden = false
        }
        if self.paramsSegue == "password" {
            cardPassword.isHidden = false
        }
        if self.paramsSegue == "birthday" {
            cardBirthday.isHidden = false
        }
        
        btnPassword.isEnabled = false
        btnEmail.isEnabled = false
        btnBirthday.isEnabled = false
    }
    
    @IBAction func behind(_ sender: UIButton) {
        dismiss(animated: true, completion: nil )
    }
    
    @IBAction func listenerNewEmail(_ sender: UITextField) {
        if isValidEmailAddress(email: txtNewEmail.text!) {
            btnEmail.isEnabled = true
        } else {
            btnEmail.isEnabled = false
        }
    }
    
    @IBAction func changeEmail(_ sender: UIButton) {
        self.alertAvanced(this: self, titileAlert: "¿Esta seguro?", bodyAlert: "Se cambiará el correo electrónico") { result in
            if result == "acept" {
                let params = [
                    "email": self.txtNewEmail.text!
                ]
                self.editModel.restApi(params: params, method: .POST, action: .changeEmail, complete: { resp in
                    let data = JSON(resp)
                    if data["status"] == 200 {
                        self.alertSimple(this: self, titileAlert: "Exito!", bodyAlert: "Se ha cambiado con exito el correo electrónico", complete: { r in
                            self.dismiss(animated: true, completion: nil )
                        })
                    }
                    if data["status"] == 401 {
                        self.alertSimple(this: self, titileAlert: "Error fatal!", bodyAlert: "El token de autenticación es invalido", complete: { r in
                            
                        })
                    }
                    if data["status"] == 500 {
                        self.alertSimple(this: self, titileAlert: "Error fatal!", bodyAlert: "Se ha producido un error, intentalo más tarde", complete: { r in
                            
                        })
                    }
                })
            } else {
                self.txtNewEmail.text = ""
            }
        }
    }
    
    
    
    
    @IBAction func listenerOldPassword(_ sender: UITextField) {
        validPassword()
    }
    
    @IBAction func listenerNewPassword(_ sender: UITextField) {
        validPassword()
    }
    
    @IBAction func changePassword(_ sender: UIButton) {
        self.alertAvanced(this: self, titileAlert: "¿Esta seguro?", bodyAlert: "Se cambiará la contraseña actual") { result in
            if result == "acept" {
                let params = [
                    "password": self.txtOldPassword.text!,
                    "newpass": self.txtNewPassword.text!
                ]
                self.editModel.restApi(params: params, method: .POST, action: .changePassword, complete: { resp in
                    let data = JSON(resp)
                    print( data )
                    if data["status"] == 200 {
                        self.alertSimple(this: self, titileAlert: "Exito!", bodyAlert: "La contraseña actual ha sido cambiada con éxito", complete: { r in
                            self.txtOldPassword.text = ""
                            self.txtNewPassword.text = ""
                            self.dismiss(animated: true, completion: nil )
                        })
                    }
                    if data["status"] == 402 {
                        self.alertSimple(this: self, titileAlert: "Error fatal!", bodyAlert: "El token de autenticación es invalido", complete: { r in
                            self.txtOldPassword.text = ""
                            self.txtNewPassword.text = ""
                        })
                    }
                    if data["status"] == 500 {
                        self.alertSimple(this: self, titileAlert: "Error fatal!", bodyAlert: "Se ha producido un error, intentalo más tarde", complete: { r in
                            self.txtOldPassword.text = ""
                            self.txtNewPassword.text = ""
                        })
                    }
                    if data["status"] == 401 {
                        self.alertSimple(this: self, titileAlert: "Alerta!", bodyAlert: "La contraseña actual es incorrecta", complete: { r in
                            self.txtOldPassword.text = ""
                        })
                    }
                })
            } else {
                self.txtOldPassword.text = ""
                self.txtNewPassword.text = ""
            }
        }
    }
    

    
    @IBAction func listenerBirthday(_ sender: UIDatePicker) {
        btnBirthday.isEnabled = true
    }
    
    @IBAction func changeBirthday(_ sender: UIButton) {
        self.alertAvanced(this: self, titileAlert: "¿Esta seguro?", bodyAlert: "Se cambiará la fecha de nacimiento actual") { result in
            if result == "acept" {
                let formater = DateFormatter()
                formater.dateFormat = "dd/MM/yyyy"
                let birthday = formater.string( from: self.txtBirthday.date )
                let params = ["birthday": birthday]
                self.editModel.restApi(params: params, method: .POST, action: .changeBirthday, complete: { resp in
                    let data = JSON(resp)
                    print(data)
                    if data["status"] == 200 {
                        self.alertSimple(this: self, titileAlert: "Exito!", bodyAlert: "La fecha de nacimiento ha sido cambiada exitosamente.", complete: { r in
                            self.dismiss(animated: true, completion: nil )
                        })
                    }
                    if data["status"] == 500 {
                        self.alertSimple(this: self, titileAlert: "Error fatal!", bodyAlert: "Se ha producido un error, intentalo más tarde.", complete: { r in
                            
                        })
                    }
                })
            
            }
        }
    }
    
    private func isValidEmailAddress(email: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = email as NSString
            let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0{
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    private func validPassword(){
        if ( txtNewPassword.text?.count )! > 8 {
            btnPassword.isEnabled = true
        }
        if ( txtNewPassword.text?.count )! < 8 {
            btnPassword.isEnabled = false
        }
        if ( txtOldPassword.text?.count )! > 8 {
            btnPassword.isEnabled = true
        }
        if ( txtOldPassword.text?.count )! < 8 {
            btnPassword.isEnabled = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
