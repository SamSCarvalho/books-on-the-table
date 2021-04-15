//
//  SecurityCoordinator.swift
//  books-on-the-table
//
//  Created by administrator on 4/13/21.
//

import UIKit

class SecurityCoordinator {
    
    // MARK: - Constants
    
    let kTokenKey = "securityToken"
    
    //MARK: - Properties
    
    let navigationController: UINavigationController
    
//    public private(set) var token: Token?
    
    weak var securityCoordinatorDelegate: SecurityCoordinatorDelegate?
    
    let keychain = KeychainSwift()
    
    public private(set) var token: Token? {
        get {
            var token: Token?
            if let tokenData = keychain.getData(kTokenKey) {
                let decoder = JSONDecoder()
                token = try? decoder.decode(Token.self, from: tokenData)
            }
            return token
        }
        set {
            let encoder = JSONEncoder()
            if let token = newValue,
               let tokenData = try? encoder.encode(token) {
                keychain.set(tokenData, forKey: kTokenKey)
            } else {
                keychain.delete(kTokenKey)
            }
        }
    }
    
    
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
        securityCoordinatorDelegate?.successAuth()
    }
    
}
