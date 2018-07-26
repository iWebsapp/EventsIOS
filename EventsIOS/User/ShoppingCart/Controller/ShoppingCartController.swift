//
//  ShoppingCartController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 18/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ShoppingCartController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    private var listArticleShopping: [Shopping] = [Shopping]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        listArticleShopping.append( Shopping(picture: "food-enchiladas", name: "Este es el producto numero 1", pieces: "1"))
        listArticleShopping.append( Shopping(picture: "food-enchiladas", name: "Este es el producto numero 2", pieces: "1"))
        listArticleShopping.append( Shopping(picture: "food-enchiladas", name: "Este es el producto numero 3", pieces: "1"))
        listArticleShopping.append( Shopping(picture: "food-enchiladas", name: "Este es el producto numero 4", pieces: "1"))
        listArticleShopping.append( Shopping(picture: "food-enchiladas", name: "Este es el producto numero 5", pieces: "1"))
        listArticleShopping.append( Shopping(picture: "food-enchiladas", name: "Este es el producto numero 6", pieces: "1"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArticleShopping.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ShoppingCartCell
        let shopping = listArticleShopping[indexPath.row]
        cell.picture.image = UIImage(named: shopping.picture)
        cell.txtName.text = shopping.name
        //cell.txtNumPieces.text = shopping.pieces
        return cell
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
