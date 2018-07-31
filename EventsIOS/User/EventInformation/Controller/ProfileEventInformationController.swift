//
//  ProfileEventInformationController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 11/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ProfileEventInformationController: UIViewController {

    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var scheduleView: UIView!
    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var addressView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scheduleView.alpha = 1
        contactView.alpha = 0
        addressView.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Themes.isNight() {
            header.image = Themes.headerEventNight
            self.view.backgroundColor = Themes.backgroundNight
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedMenuCustom(_ sender: CustomSegmentedControl) {
        let seleced = sender.selectedSegmentIndex
        if seleced == 0 {
            scheduleView.alpha = 1
            contactView.alpha = 0
            addressView.alpha = 0
        }
        if seleced == 1 {
            scheduleView.alpha = 0
            contactView.alpha = 1
            addressView.alpha = 0
        }
        if seleced == 2 {
            scheduleView.alpha = 0
            contactView.alpha = 0
            addressView.alpha = 1
        }
    }
    
    
    @IBAction func behind(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
