//
//  AppRouter.swift
//  PizzaDeliveryApp
//
//  Created by Богдан Тарченко on 29.01.2025.
//

import UIKit
import KeychainAccess

protocol AppRouterDelegate: AnyObject {
    func start()
}

final class AppRouter: AppRouterDelegate {
    private let window: UIWindow?
    private let factory: ViewControllerFactory
    
    init(window: UIWindow?, factory: ViewControllerFactory = DefaultViewControllerFactory()) {
        self.window = window
        self.factory = factory
    }
    
    func start() {
        let keychain = Keychain()
        let authTokenExists = (try? keychain.get("authToken")) != nil
        
        let initialViewController: UIViewController = authTokenExists ? factory.createMainTabBarController() : factory.createAuthorizationViewController()
        
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
    }
}
