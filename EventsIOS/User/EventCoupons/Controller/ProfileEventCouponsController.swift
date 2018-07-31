//
//  ProfileEventCouponsController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 11/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ProfileEventCouponsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var collectionCoupons: UICollectionView!
    private var eventCouponListViewModel: EventCouponsListViewModel!
    private var eventCouponModel: EventCouponsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionCoupons.delegate = self
        collectionCoupons.dataSource = self
        self.eventCouponModel = EventCouponsModel()
        self.eventCouponListViewModel = EventCouponsListViewModel(eventCoupons: self.eventCouponModel)
        DispatchQueue.main.async {
            self.collectionCoupons.reloadData()
        }
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.eventCouponListViewModel.eventCouponsViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionCoupons.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCouponsCell
        let coupon = self.eventCouponListViewModel.eventCouponsViewModel[indexPath.item]
        cell.txtTitleBusiness.text = coupon.business
        cell.txtDescription.text = coupon.description
        cell.txtExpiration.text = coupon.expiration
        cell.txtTitle.text = coupon.title
        cell.image.image = UIImage(named: coupon.image)
        cell.cartView.topColor = self.randomColor()
        cell.cartView.bottomColor = self.randomColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goInfoCoupons", sender: self)
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
