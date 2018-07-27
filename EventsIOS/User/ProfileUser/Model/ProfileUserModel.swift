//
//  ProfileUserModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 26/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class ProfileUserModel {
    
    public var menuItemsProfile:[ProfileEvent] = [ProfileEvent]()
    public func getItemsMenuProfile() -> [ProfileEvent]{
        menuItemsProfile.append( ProfileEvent(icon: "icon-settings", title: "Configuración") )
        menuItemsProfile.append( ProfileEvent(icon: "menu-events", title: "Mis Eventos") )
        menuItemsProfile.append( ProfileEvent(icon: "icon-info", title: "Quiénes somos") )
        menuItemsProfile.append( ProfileEvent(icon: "icon-report", title: "Reportar un problema") )
        menuItemsProfile.append( ProfileEvent(icon: "icon-help", title: "Servicio de ayuda") )
        menuItemsProfile.append( ProfileEvent(icon: "icon-conditions", title: "Privacidad y condiciones") )
        menuItemsProfile.append( ProfileEvent(icon: "icon-logout", title: "Cerrar sesión") )
        return menuItemsProfile
    }
    
}
