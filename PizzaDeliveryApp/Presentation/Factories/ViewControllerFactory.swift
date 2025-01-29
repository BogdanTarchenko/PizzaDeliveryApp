//
//  ViewControllerFactory.swift
//  PizzaDeliveryApp
//
//  Created by Богдан Тарченко on 29.01.2025.
//

import UIKit

protocol ViewControllerFactory {
    func createMainTabBarController() -> UIViewController
    func createAuthorizationViewController() -> UIViewController
}

final class DefaultViewControllerFactory: ViewControllerFactory {
    func createMainTabBarController() -> UIViewController {
        let tabBarController = UITabBarController()
        
        let pizzaVC = createPizzaViewController()
        pizzaVC.tabBarItem = UITabBarItem(title: LocalizedKey.Factory.ViewControllerFactory.pizzaTabTitle, image: Constants.pizzaTabImage, tag: 0)
        
        let ordersVC = createOrdersViewController()
        ordersVC.tabBarItem = UITabBarItem(title: LocalizedKey.Factory.ViewControllerFactory.ordersTabTitle, image: Constants.ordersTabImage, tag: 1)
        
        let cartVC = createCartViewController()
        cartVC.tabBarItem = UITabBarItem(title: LocalizedKey.Factory.ViewControllerFactory.cartTabTitle, image: Constants.cartTabImage, tag: 2)
        
        let profileVC = createProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: LocalizedKey.Factory.ViewControllerFactory.profileTabTitle, image: Constants.profileTabImage, tag: 3)
        
        tabBarController.viewControllers = [
            UINavigationController(rootViewController: pizzaVC),
            UINavigationController(rootViewController: ordersVC),
            UINavigationController(rootViewController: cartVC),
            UINavigationController(rootViewController: profileVC)
        ]
        
        return tabBarController
    }
    
    func createAuthorizationViewController() -> UIViewController {
        let viewController = AuthorizationViewController()
        return UINavigationController(rootViewController: viewController)
    }
    
    private func createPizzaViewController() -> UIViewController {
        return PizzaViewController()
    }
    
    private func createOrdersViewController() -> UIViewController {
        return OrdersViewController()
    }
    
    private func createCartViewController() -> UIViewController {
        return CartViewController()
    }
    
    private func createProfileViewController() -> UIViewController {
        return ProfileViewController()
    }
}

private extension DefaultViewControllerFactory {
    enum Constants {
        static var pizzaTabImage: UIImage? {
            return UIImage(named: "pizzaTabImage")
        }
        
        static var ordersTabImage: UIImage? {
            return UIImage(named: "ordersTabImage")
        }
        
        static var cartTabImage: UIImage? {
            return UIImage(named: "cartTabImage")
        }
        
        static var profileTabImage: UIImage? {
            return UIImage(named: "profileTabImage")
        }
    }
}
