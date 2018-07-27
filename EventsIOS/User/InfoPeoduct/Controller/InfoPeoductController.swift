//
//  InfoPeoductController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 21/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class InfoPeoductController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var txtDescription: UILabel!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var header: UIImageView!
    private var listInfoProduct: InfoPeoduct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collection.delegate = self
        collection.dataSource = self
        if Themes.isNight() {
            header.image = Themes.headerEventNight
            self.view.backgroundColor = Themes.backgroundNight
        }
        listInfoProduct = InfoPeoduct(images: ["food-enchiladas", "food-huacamole", "food-manchamantel", "food-mole", "food-nuggets"], title: "Producto 1", description: "Este es el producto 1")
        txtTitle.text = listInfoProduct.title
        txtDescription.text = listInfoProduct.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listInfoProduct.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! InfoPeoductCell
        cell.picture.image = UIImage(named: listInfoProduct.images[indexPath.row])
        return cell
    }
    
    @IBAction func behind(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addShopping(_ sender: UIButton) {
        
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
