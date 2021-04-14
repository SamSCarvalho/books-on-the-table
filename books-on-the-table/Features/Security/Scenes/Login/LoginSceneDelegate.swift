//
//  UserSceneDelegate.swift
//  books-on-the-table
//
//  Created by administrator on 4/14/21.
//

import Foundation

// MARK: - Protocols

protocol LoginSceneDelegate: class {
    func loginScene(_ loginScene: LoginViewController, didAuthenticateWith token: Token)
}
