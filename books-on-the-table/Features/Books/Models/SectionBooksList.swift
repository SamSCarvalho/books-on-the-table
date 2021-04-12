//
//  SectionBooksList.swift
//  books-on-the-table
//
//  Created by administrator on 4/7/21.
//

import Foundation

struct SectionBooksList {
    // MARK: - Atributes
    
    let sections: [SectionBooks]
    
    // MARK: - LifeCycle
    
    init(bookList: [Book]) {
        self.sections = [
            SectionBooks(title: "Lendo", books: bookList.filter {$0.status == .reading}),
            SectionBooks(title: "Para ler", books: bookList.filter {$0.status == .toRead}),
            SectionBooks(title: "Já lidos", books: bookList.filter {$0.status == .done}),
        ]
    }
}
