//
//  Themes.swift
//  EventsIOS
//
//  Created by Luis Castillo on 26/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class Themes {
    
    static let headerGobalNight = UIImage(named: "headers-global-night")
    static let headerEventNight = UIImage(named: "headers-profile-night")
    static let headerGobalCutNight = UIImage(named: "header-cut-night")
    static let backgroundLoginNight = UIImage(named: "wallpaper-night")
    static let backgroundRegister = UIImage(named: "fondo-create-user-night")
    
    static let backgroundNight = UIColor(named: "backgroundNight")
    static let tabbarNight = UIColor(named: "tabbarNight")
    static let tintColorNight = UIColor(named: "tintColorNight")
    static let unselectedColorNight = UIColor(named: "unselectedColorNight")
    
    static let buttomLocalizationColorNight = UIColor(named: "buttomLocalizationColorNight")
    
    static func isNight() ->Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "H"
        let dateString = formatter.string(from: Date())
        let currentDate = dateString.components(separatedBy: " ")
        
        if currentDate.count == 1 {
            
            switch currentDate[0] {
                case "1":
                    return true
                case "2":
                    return true
                case "3":
                    return true
                case "4":
                    return true
                case "5":
                    return true
                case "6":
                    return true
                case "20":
                    return true
                case "21":
                    return true
                case "22":
                    return true
                case "23":
                    return true
                case "0":
                    return true
                default:
                    return false
            }

        } else {
            
            if currentDate[0] == "8" {
                if currentDate[1] == "p." {
                    return true
                }
            }
            if currentDate[0] == "9" {
                if currentDate[1] == "p." {
                    return true
                }
            }
            if currentDate[0] == "10" {
                if currentDate[1] == "p." {
                    return true
                }
            }
            if currentDate[0] == "11" {
                if currentDate[1] == "p." {
                    return true
                }
            }
            if currentDate[0] == "12" {
                if currentDate[1] == "a." {
                    return true
                }
            }
            if currentDate[0] == "1" {
                if currentDate[1] == "a." {
                    return true
                }
            }
            if currentDate[0] == "2" {
                if currentDate[1] == "a" {
                    return true
                }
            }
            if currentDate[0] == "3" {
                if currentDate[1] == "a." {
                    return true
                }
            }
            if currentDate[0] == "4" {
                if currentDate[1] == "a." {
                    return true
                }
            }
            if currentDate[0] == "5" {
                if currentDate[1] == "a." {
                    return true
                }
            }
            
            return false

        }
        

    }
    
}
