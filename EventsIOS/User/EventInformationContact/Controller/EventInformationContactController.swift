//
//  EventInformationContactController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 28/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class EventInformationContactController: UIViewController {

    @IBOutlet weak var txtTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if Themes.isNight() {
            txtTitle.textColor = Themes.unselectedColorNight
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
