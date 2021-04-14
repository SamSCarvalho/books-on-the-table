//
//  MainCoordinator.swift
//  books-on-the-table
//
//  Created by administrator on 4/13/21.
//

import UIKit

class MainCoordinator {
    
    // Properties
    
    let navigationController: UINavigationController
    let securityCoordinator: SecurityCoordinator
    let booksCoordinator: BooksCoordinator
        
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        navigationController.navigationBar.isHidden = true
        
        self.navigationController = navigationController
        self.securityCoordinator = SecurityCoordinator(navigationController: navigationController)
        self.booksCoordinator = BooksCoordinator(navigationController: navigationController)
    }
    
    // MARK: - Public Methods
    
    func start() {
        let token = securityCoordinator.token
        if let token = token {
            booksCoordinator.token = token
            booksCoordinator.start()
        } else {
            securityCoordinator.mainCoordinatorDelegate = self
            securityCoordinator.start()
        }
    }
}


extension MainCoordinator: MainCoordinadorDelegate {
    
    func initialScene() {
        let token = securityCoordinator.token
        if let token = token {
            booksCoordinator.token = token
            booksCoordinator.start()
        } else {
            securityCoordinator.start()
        }
    }
    
}
