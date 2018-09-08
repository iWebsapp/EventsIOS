//
//  AboutController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 17/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit
import SwiftyJSON

class AboutController: UIViewController {

    @IBOutlet weak var txtMode: UILabel!
    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var txtLabel: UITextView!
    private var aboutModel: Webservice!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.envWhatModeIs() == "debug" {
            txtMode.isHidden = false
        } else {
            txtMode.isHidden = true
        }
        self.aboutModel = Webservice()
        DispatchQueue.main.async {
            self.getAbout()
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
    
    func getAbout(){
        self.aboutModel.restApi(method: .GET, action: .abouts) { resp in
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
