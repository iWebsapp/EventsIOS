//
//  MyCouponsController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 17/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class MyCouponsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionCoupons: UICollectionView!
    @IBOutlet weak var header: UIImageView!
    private var mycouponsListViewModel: MyCouponsListViewModel!
    private var mycouponsModel:  MyCouponsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionCoupons.delegate = self
        collectionCoupons.dataSource = self
        if Themes.isNight() {
            header.image = Themes.headerGobalNight
            self.view.backgroundColor = Themes.backgroundNight
            self.tabBarController?.tabBar.barTintColor = Themes.backgroundNight
            self.tabBarController?.tabBar.tintColor = Themes.tintColorNight
            self.tabBarController?.tabBar.unselectedItemTintColor = Themes.unselectedColorNight
        }
        self.mycouponsModel = MyCouponsModel()
        self.mycouponsListViewModel = MyCouponsListViewModel(couponsModel: self.mycouponsModel)
        DispatchQueue.main.async {
            self.collectionCoupons.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.mycouponsListViewModel.myCouponsViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionCoupons.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCouponsCell
        let coupon = self.mycouponsListViewModel.myCouponsViewModel[indexPath.item]
        cell.txtTitle.text = coupon.title
        cell.txtExpiration.text = coupon.expiration
        cell.txtDescription.text = coupon.description
        cell.txtTitleBusiness.text = coupon.business
        cell.image.image = UIImage(named: coupon.image)
        cell.cartView.topColor = self.randomColor()
        cell.cartView.bottomColor = self.randomColor()
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
