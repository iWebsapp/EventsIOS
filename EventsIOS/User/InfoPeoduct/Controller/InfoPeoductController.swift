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
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var header: UIImageView!
    private var listInfoProduct: InfoPeoduct!
    private var infoProductListViewModel: InfoPeoductListViewModel!
    private var infoProductModel: InfoPeoductModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collection.delegate = self
        collection.dataSource = self
        if Themes.isNight() {
            header.image = Themes.headerEventNight
            //txtDescription.textColor = Themes.unselectedColorNight
            //labelDescription.textColor = Themes.unselectedColorNight
            self.view.backgroundColor = Themes.backgroundNight
        }
        self.infoProductModel = InfoPeoductModel()
        self.infoProductListViewModel = InfoPeoductListViewModel(producModel: self.infoProductModel)
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
        txtTitle.text = self.infoProductListViewModel.infoProductViewModel[0].title
        txtDescription.text = self.infoProductListViewModel.infoProductViewModel[0].description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.infoProductListViewModel.infoProductViewModel[section].images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! InfoPeoductCell
        let picture = self.infoProductListViewModel.infoProductViewModel[0].images[indexPath.row]
        cell.picture.image = UIImage(named: picture)
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
