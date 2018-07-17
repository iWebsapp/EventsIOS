//
//  ProfileEventPromotionsController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 11/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ProfileEventPromotionsController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    private var promotions: [PromotionsEvent] = [PromotionsEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        promotions.append( PromotionsEvent(title: "El Tradicional Guacamole", description: "2x1", picture: "food-huacamole"))
        promotions.append( PromotionsEvent(title: "Sopa de Tortilla", description: "Refresco gratis", picture: "food-sopa-tortila"))
        promotions.append( PromotionsEvent(title: "Pechuga con Mole Poblano", description: "15% de descuento", picture: "food-mole"))
        promotions.append( PromotionsEvent(title: "Tacos Dorados de Pollo", description: "Viernes al 2X1", picture: "food-tacos"))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promotions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PromotionsEventCell
        let promotion = promotions[indexPath.row]
        cell.titlePromotions.text = promotion.title
        cell.descriptionPromotions.text = promotion.description
        cell.picturePromotions.image = UIImage(named: promotion.picture)
        return cell
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
