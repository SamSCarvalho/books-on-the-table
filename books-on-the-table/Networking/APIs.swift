//
//  APIs.swift
//  books-on-the-table
//
//  Created by administrator on 4/5/21.
//

import Foundation

class APIs {
    
    // MARK: - Constantes
    
    private let apiUrl = "http://127.0.0.1:8080"
    
    // MARK: - Properties
    
    lazy var books: BookAPI = {
        return BookAPI.init()
    }()
    
    lazy var token: TokenAPI = {
        return TokenAPI.init()
    }()
    
    lazy var users: UsersAPI = {
        return UsersAPI.init()
    }()
      
    
}
