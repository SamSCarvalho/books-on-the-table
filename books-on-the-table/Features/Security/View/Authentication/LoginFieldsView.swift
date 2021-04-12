//
//  LoginFieldsView.swift
//  books-on-the-table
//
//  Created by administrator on 4/11/21.
//

import UIKit

typealias LoginCredential = (login: String, password: String)

protocol LoginFieldsViewDelegate: AnyObject {
    func  loginFieldsView(_ loginFieldsView: LoginFieldsView, didProvide credential: LoginCredential)
}

@IBDesignable
class LoginFieldsView: XibView {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var loginLabel: UILabel!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    
    // MARK: - Atributes
    
    weak var delegate: LoginFieldsViewDelegate?
    
    @IBInspectable
    var loginFieldTitle: String {
        get {
            return loginLabel.text ?? ""
        }
        set {
            loginLabel.text = newValue
        }
    }
    
    @IBInspectable
    var passwordFieldTitle: String {
        get {
            return passwordLabel.text ?? ""
        }
        set {
            passwordLabel.text = newValue
        }
    }
    
    @IBInspectable
    var loginButtonTitle: String {
        get {
            return loginButton.title(for: .normal) ?? ""
        }
        set {
            loginButton.setTitle(newValue, for: .normal)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func handleLogin() {
        guard let login = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        let credential = LoginCredential(login: login, password: password)
        delegate?.loginFieldsView(self, didProvide: credential)
    }
    
    
    
}
