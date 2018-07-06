//
//  InvitationCard.swift
//  EventsIOS
//
//  Created by Luis Castillo on 05/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import MapKit
import AddressBook

class InvitationCard: NSObject, MKAnnotation {
    
    public let title: String?
    public let locationName: String?
    public let coordinate: CLLocationCoordinate2D
    
    init(title: String?,locationName: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
//    func mapItem() -> MKMapItem {
//        let addressDictiionary = [String(kABPersonAddressStateKey): subtitle]
//        let market = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictiionary)
//        let mapItem = MKMapItem(placemark: market)
//        mapItem.name = "\(title!) \(subtitle!)"
//        return mapItem
//    }
    
}
