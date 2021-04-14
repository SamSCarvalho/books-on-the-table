//
//  UserViewController.swift
//  books-on-the-table
//
//  Created by administrator on 4/11/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var loginFields: LoginFieldsView!
    
    weak var sceneDelegate: LoginSceneDelegate?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        loginFields.delegate = self
    }
    
    // MARK: - Functions
    
    func messageAlert(_ title: String, body: String) {
        let alert: UIAlertController = UIAlertController(
            title: title,
            message: body,
            preferredStyle: .alert
        )
        
        let confirmButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(confirmButton)
        self.present(alert, animated: true)
    }
}

extension LoginViewController: LoginFieldsViewDelegate {
    func loginFieldsView(_ loginFieldsView: LoginFieldsView, didProvide credential: LoginCredential) {

        let user = User(with: credential)
        APIs().token.login(user: user) { (result: Result<Token, Error>) in
            switch (result) {
                case .success(let token):
                    self.sceneDelegate?.loginScene(self, didAuthenticateWith: token)
                case .failure(let error):
                    print(error)
                    self.messageAlert("Error to authenticate", body: error.localizedDescription)
            }
        }
    }
}
