//
//  NotificationModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 07/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class NotificationModel {
    
    public var notifications = [Notification]()
    
    public func getAllNotifications() -> [Notification] {
        notifications.append( Notification(avatar: "1.jpg", date: "Hace 2 horas", user: "Luis Castillo", description: "Acepto para que hayavas a su evento"))
        notifications.append( Notification(avatar: "2.jpg", date: "Hace 2 minutos", user: "Ana Mireya", description: "Rechazo para que hayavas a su evento"))
        notifications.append( Notification(avatar: "3.jpg", date: "Hace 27 segundos", user: "Dolores Imelda", description: "Agrego un nuevo evento"))
        notifications.append( Notification(avatar: "4.jpg", date: "Hace 15 minutos", user: "Rott Castillo", description: "Acepto para que hayavas a su evento"))
        notifications.append( Notification(avatar: "5.jpg", date: "Hace 1 dia", user: "Luis Castillo", description: "Agrego nuevos productos al menu"))
        return notifications
    }
    
}
