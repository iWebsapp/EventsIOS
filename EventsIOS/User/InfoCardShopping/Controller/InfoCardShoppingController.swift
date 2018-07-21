//
//  InfoCardShoppingController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 20/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class InfoCardShoppingController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    private var lisShoping: [InfoCardShopping] = [InfoCardShopping]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        lisShoping.append( InfoCardShopping(name: "Tienda 1", picture: "food-mole", open: false, total: "$127.00 mxn",
        products: [Products(name: "Producto 1", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 1"),
                   Products(name: "Producto 2", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 2"),
                   Products(name: "Producto 3", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 3"),
                   Products(name: "Producto 4", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 4")]))
        
        lisShoping.append( InfoCardShopping(name: "Tienda 1", picture: "food-mole", open: false, total: "$127.00 mxn",
        products: [Products(name: "Producto 5", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 5"),
                   Products(name: "Producto 6", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 6"),
                   Products(name: "Producto 7", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 7"),
                   Products(name: "Producto 8", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 8")]))
        
        lisShoping.append( InfoCardShopping(name: "Tienda 1", picture: "food-mole", open: false, total: "$127.00 mxn",
        products: [Products(name: "Producto 9", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 9"),
                   Products(name: "Producto 10", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 10"),
                   Products(name: "Producto 11", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 11"),
                   Products(name: "Producto 12", picture: "food-mole", price: "120.00 mxn", description: "Descripcion 12")]))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return lisShoping.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if lisShoping[section].open == true {
            return lisShoping[section].products.count + 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventCell
            cell.cardView.topColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0)
            cell.cardView.bottomColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            
            cell.txtName.text = lisShoping[indexPath.section].name
            cell.avatar.image = UIImage(named: lisShoping[indexPath.section].picture)
            cell.txtDate.text = lisShoping[indexPath.section].total
            return cell
        }else{
            let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventCell
            cell.cardView.topColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            cell.cardView.bottomColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            cell.cardView.shadowColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            
            cell.txtName.text = lisShoping[indexPath.section].products[indexPath.row - 1].name
            cell.avatar.image = UIImage(named: lisShoping[indexPath.section].products[indexPath.row - 1].picture)
            cell.txtDate.text = lisShoping[indexPath.section].products[indexPath.row - 1].price
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if lisShoping[indexPath.section].open == true {
                lisShoping[indexPath.section].open = false
                let secciones = IndexSet.init(integer: indexPath.section)
                table.reloadSections(secciones, with: .fade)
            }else{
                lisShoping[indexPath.section].open = true
                let secciones = IndexSet.init(integer: indexPath.section)
                table.reloadSections(secciones, with: .fade)
            }
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
