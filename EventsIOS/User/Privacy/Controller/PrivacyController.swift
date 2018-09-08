//
//  PrivacyController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 17/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit
import SwiftyJSON

class PrivacyController: UIViewController {

    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var txtLabel: UITextView!
    @IBOutlet weak var txtMode: UILabel!
    private var privacyModel: Webservice!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.envWhatModeIs() == "debug" {
            txtMode.isHidden = false
        } else {
            txtMode.isHidden = true
        }
        
        self.privacyModel = Webservice()
        DispatchQueue.main.async {
            self.getPrivacy()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Themes.isNight() {
            header.image = Themes.headerGobalNight
            txtLabel.textColor = Themes.unselectedColorNight
            self.view.backgroundColor = Themes.backgroundNight
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func behind(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    func getPrivacy(){
        self.privacyModel.restApi(method: .GET, action: .privacy) { resp in
            let data = JSON(resp)
            if data["status"] == 200 {
                let content:String = "\(data["data"][0]["content"])"
                self.txtLabel.text = content
            } else {
                self.txtLabel.text = "No se ha encontrado información"
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
