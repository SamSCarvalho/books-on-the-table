//
//  SectionLivros.swift
//  books-on-the-table
//
//  Created by administrator on 3/30/21.
//

import UIKit

class SectionBooks: NSObject {

    // MARK: - Atributes
    
    let title: String
    let books: Array<Book>
    
    
    // MARK: - LifeCycle
    
    init(title: String, books: Array<Book>) {
        self.title = title
        self.books = books
    }

}
