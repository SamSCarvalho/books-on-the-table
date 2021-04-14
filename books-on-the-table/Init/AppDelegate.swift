//
//  AppDelegate.swift
//  books-on-the-table
//
//  Created by administrator on 3/30/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController = UIViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        coordinator = MainCoordinator(navigationController: navigationController)
        
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

