//
//  LocalizedKey.swift
//  PizzaDeliveryApp
//
//  Created by Богдан Тарченко on 29.01.2025.
//

import Foundation

enum LocalizedKey {
    enum Factory {
        enum ViewControllerFactory {
            static var pizzaTabTitle: String {
                return NSLocalizedString("pizzaTabTitle", comment: "")
            }
            
            static var ordersTabTitle: String {
                return NSLocalizedString("ordersTabTitle", comment: "")
            }
            
            static var cartTabTitle: String {
                return NSLocalizedString("cartTabTitle", comment: "")
            }
            
            static var profileTabTitle: String {
                return NSLocalizedString("profileTabTitle", comment: "")
            }
        }
    }
}
