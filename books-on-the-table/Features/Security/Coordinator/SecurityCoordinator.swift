//
//  SecurityCoordinator.swift
//  books-on-the-table
//
//  Created by administrator on 4/13/21.
//

import UIKit

class SecurityCoordinator {
    
    // Properties
    
    let navigationController: UINavigationController
    
    public private(set) var token: Token?
    
    weak var mainCoordinatorDelegate: MainCoordinadorDelegate?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public Methods
    
    func start() {
        token = nil

        guard let loginViewController = self.loginViewController() else { return }
        
        navigationController.viewControllers = [loginViewController]
    }
    
}

extension SecurityCoordinator: LoginSceneDelegate {
    
    private func loginViewController() -> LoginViewController? {
        let storyboardBook = UIStoryboard(name:"User", bundle: nil)
        let viewController = storyboardBook.instantiateViewController(identifier: "login") as? LoginViewController
        
        viewController?.sceneDelegate = self
        
        return viewController
    }
    
    func loginScene(_ loginScene: LoginViewController, didAuthenticateWith token: Token) {
        self.token = token
        debugPrint("@ Received Token: \(token)")
        mainCoordinatorDelegate?.initialScene()
    }
    
}
