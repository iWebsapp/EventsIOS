//
//  SelectMyCouponController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 25/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class SelectMyCouponController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    @IBOutlet weak var collectionCoupons: UICollectionView!
    private var selectMyCouponsLisViewModel: SelectMyCouponListViewModel!
    private var selecttMyCouponsModel: SelectMyCouponModel!
    private var coupons: [Coupons] = [Coupons]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        collectionCoupons.delegate = self
        collectionCoupons.dataSource = self
        self.selecttMyCouponsModel = SelectMyCouponModel()
        self.selectMyCouponsLisViewModel = SelectMyCouponListViewModel(selectMyCoupons: self.selecttMyCouponsModel)
        DispatchQueue.main.async {
            self.collectionCoupons.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.selectMyCouponsLisViewModel.selectMyCouponsViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionCoupons.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCouponsCell
        let coupon = self.selectMyCouponsLisViewModel.selectMyCouponsViewModel[indexPath.item]
        cell.txtTitle.text = coupon.title
        cell.txtExpiration.text = coupon.expiration
        cell.txtDescription.text = coupon.description
        cell.txtTitleBusiness.text = coupon.business
        cell.image.image = UIImage(named: coupon.image)
        cell.cartView.topColor = self.randomColor()
        cell.cartView.bottomColor = self.randomColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil )
    }
    
    @IBAction func behind(_ sender: UIButton) {
        dismiss(animated: true, completion: nil )
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
