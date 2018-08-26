//
//  ViewController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 02/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class Caracteres {
    
    var sinonimos: [String]
    
    init(sin: [String]){
        self.sinonimos = sin
    }
    
}

class CaracteresModel {
    
    public var listCaracters: [String] = [String]()
    public var numOfCaracters: Int = 5
    init(){
        listCaracters.append("B L O R U")
        listCaracters.append("A N T R O")
        listCaracters.append("T I M B A")
        listCaracters.append("B O R R A C H E R A")
        listCaracters.append("B I M B A")
        listCaracters.append("L O C U R A E N S W A H I L I")
        listCaracters.append("W A Z I M U")
        listCaracters.append("J U N T O S")
        listCaracters.append("K U S H A")
//        listCaracters.append("b a i l e")
//        listCaracters.append("c o m i d a")
//        listCaracters.append("d i v e r t i d o")
//        listCaracters.append("v a c a c i o n")
//        listCaracters.append("d e s c a n s o")
//        listCaracters.append("f e s t i v i d i d a d")
//        listCaracters.append("g u a t e q u e")
//        listCaracters.append("c e l e b r a c i o n")
//        listCaracters.append("c o n v i t e")
//        listCaracters.append("f e s t e j o")
//        listCaracters.append("v e l a d a")
//        listCaracters.append("e s p e c t a c u l o")
//        listCaracters.append("m i m o s")
//        listCaracters.append("a g a s a j o s")
//        listCaracters.append("v a c a c i o n")
//        listCaracters.append("h a l a g o s")
//        listCaracters.append("k e r m e s")
//        listCaracters.append("p a d r e")
//        listCaracters.append("d e s v e r g u e")
//        listCaracters.append("a l e g r i a")
//        listCaracters.append("f e l i c i d a d")
//        listCaracters.append("f e s t e j o")
//        listCaracters.append("j u e r g a")
//        listCaracters.append("d i v e r s i o n")
//        listCaracters.append("d i s t r a c c i o n")
//        listCaracters.append("f e s t i v i d a d")
//        listCaracters.append("a l e g r i a")
//        listCaracters.append("a n i m a c i o n")
//        listCaracters.append("a n i m o")
//        listCaracters.append("c o m i d a")
//        listCaracters.append("b r o m a")
//        listCaracters.append("e n t r e t e n i m i e n t o")
//        listCaracters.append("e n t u s i a s m o")
//        listCaracters.append("o p t i m i s m o")
//        listCaracters.append("p l a c e r")
//        listCaracters.append("v i v a c i d a d")
//        listCaracters.append("g l o o m i t t y")
//        listCaracters.append("p a c h a n g a")
//        listCaracters.append("f e s t i v a l")
        //festival - slasf
        //festival:  fells
        //festival:  favit
        //festival:  leait
        //festividad:  tiest
        //diversion - roine
        //gloomitty - glomy
        //gloomitty:  tiyil
        //alegria:  ilgire
        //alegria:  gareaa
        //optimismo:  tiosto
        //kermes:  semsek
        //distraccion:  crioco
        //distraccion:  didca
        //alboroto:  bloroo
        //vacacion:  vanai
        //padre:  apeap
        //timba:  amatm
        //locura swahili:  oasir
        //bimba:  bmami
        //juntos:  jonun
        //kusha:  sukss
        //antro:  anant
        //kusha:  skask
    }
    
    public func generarRandom(letter:String){
        let strFinal = letter.split(separator: " ")
        let intStr = strFinal.count
        var returnStr = ""
        for item in 1...self.numOfCaracters {
            print(item)
            returnStr = returnStr + strFinal[ Int(arc4random_uniform(UInt32(intStr))) ]
        }
        print("Random \(letter): ", returnStr)
    }
    
}

class LoginController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var listenerLogin: UIButton!
    @IBOutlet weak var background: UIImageView!
    private var caracteresModel: CaracteresModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.delegate = self
        txtPassword.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func getRandom(_ sender: DesignableButton) {
        self.caracteresModel = CaracteresModel()
        for item in self.caracteresModel.listCaracters {
            self.caracteresModel.generarRandom(letter: item)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Themes.isNight() {
            background.image = Themes.backgroundLoginNight
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

