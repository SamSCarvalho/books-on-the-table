//
//  Teste.swift
//  books-on-the-table
//
//  Created by administrator on 4/5/21.
//

import Foundation

struct BookList: Codable {
    // MARK: - Atributes
    
    let bookList: [Book]
}

// MARK: - Extension

extension BookList {
    enum CodingKeys: String, CodingKey {
        case bookList = "items"
    }
}
