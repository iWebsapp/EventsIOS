//
//  ProfileEventProductsController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 11/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ProfileEventProductsController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var header: UIImageView!
    private var products: [ProductsEvent] = [ProductsEvent]()
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        if Themes.isNight() {
            header.image = Themes.headerEventNight
            self.view.backgroundColor = Themes.backgroundNight
        }
        products.append( ProductsEvent(name: "Enchiladas Vips", image: "food-enchiladas", price: "27.00", description: ""))
        products.append( ProductsEvent(name: "El Tradicional Guacamole", image: "food-huacamole",  price: "15.00", description: ""))
        products.append( ProductsEvent(name: "Sopa de Tortilla", image: "food-sopa-tortila", price: "157.00", description: ""))
        products.append( ProductsEvent(name: "Pechuga con Mole Poblano", image: "food-mole", price: "27.00", description: ""))
        products.append( ProductsEvent(name: "Tacos Dorados de Pollo", image: "food-tacos", price: "127.00", description: ""))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileEventProductsCell
        let product = products[indexPath.row]
        cell.pictureProduct.image = UIImage(named: product.image)
        cell.txtTitleProduct.text = product.name
        cell.txtPriceProduct.text = product.price
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goInfoProduct", sender: self)
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
