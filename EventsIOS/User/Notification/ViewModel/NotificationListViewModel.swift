//
//  NotificationListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 07/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class NotificationListViewModel {
    
    public var notificationViewModel: [NotificationViewModel] = [NotificationViewModel]()
    private var dataNotification: NotificationModel
    
    init(data: NotificationModel) {
        self.dataNotification = data
        getAllNotificationsListViewModel()
    }
    
    private func getAllNotificationsListViewModel(){
        let notification = self.dataNotification.getAllNotifications()
        self.notificationViewModel = notification.map{ notification in
            return NotificationViewModel(notifi: notification)
        }
    }
    
}
