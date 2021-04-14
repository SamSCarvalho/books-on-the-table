//
//  BooksCoordinator.swift
//  books-on-the-table
//
//  Created by administrator on 4/13/21.
//

import UIKit

class BooksCoordinator {
    
    // Properties
    
    let navigationController: UINavigationController
    public var token: Token?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public Methods
    
    func start() {
        let storyboardBook = UIStoryboard(name:"Main", bundle: nil)
        let viewController = storyboardBook.instantiateViewController(identifier: "home") as HomeViewController
        viewController.token = token
        
        navigationController.viewControllers = [viewController]
    }
    
}

extension BooksCoordinator {
    
    private func viewControllerX() -> UIViewController {
        return UIViewController()
    }
    
}
