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
    let books: [Book]
    
    
    // MARK: - LifeCycle
    
    init(title: String, books: [Book]) {
        self.title = title
        self.books = books
    }
    
    
    // MARK: - Function
    
    func getBooksFiltered(_ filter: String) -> [Book] {
        print(filter)
        if (filter == "") {
            return books
        }
        return books.filter {$0.title.lowercased().contains(filter.lowercased())}
    }

}
