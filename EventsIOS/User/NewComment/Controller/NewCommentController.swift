//
//  NewCommentController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 20/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class NewCommentController: UIViewController {

    @IBOutlet weak var header: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if Themes.isNight() {
            header.image = Themes.headerEventNight
            self.view.backgroundColor = Themes.backgroundNight
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func behind(_ sender: UIButton) {
        dismiss(animated: true, completion: nil )
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
