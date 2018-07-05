//
//  PromotionsController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 04/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class RegisterUserPromotionsController: UIViewController {

    @IBOutlet weak var listenerNext: UIButton!
    @IBOutlet weak var listenerLike: UIButton!
    @IBOutlet weak var listenerDislike: UIButton!
    var conta = 0
    var contador = 0
    let like = UIImage(named: "like")
    let selectlike = UIImage(named: "selectedLike")
    let disklike = UIImage(named: "dislike")
    let selectdisklike = UIImage(named: "selectedDiskLike")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listenerLike.setImage(like, for: .normal)
        listenerDislike.setImage(disklike, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeLike(_ sender: UIButton) {
        contador = 0
        listenerDislike.setImage(disklike, for: .normal)
        if conta == 0 {
            listenerLike.setImage(selectlike, for: .normal)
            conta = 1
        } else {
            if conta == 1 {
                listenerLike.setImage(like, for: .normal)
                conta = 0
            }
        }
    }
    
    @IBAction func changeDislike(_ sender: UIButton) {
        conta = 0
        listenerLike.setImage(like, for: .normal)
        if contador == 0 {
            listenerDislike.setImage(selectdisklike, for: .normal)
            contador = 1
        } else {
            if contador == 1 {
                listenerDislike.setImage(disklike, for: .normal)
                contador = 0
            }
        }
    }
    
    @IBAction func behind(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doubts(_ sender: UIButton) {
        let doubts = storyboard?.instantiateViewController(withIdentifier: "RegisterUserAnswers") as! RegisterUserAnswersController
        present(doubts, animated: true, completion: nil )
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
