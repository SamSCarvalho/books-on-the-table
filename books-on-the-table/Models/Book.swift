//
//  Livro.swift
//  books-on-the-table
//
//  Created by administrator on 3/30/21.
//

import UIKit

class Book: NSObject {
    let title: String
    let author: String
    let type: Int
    let status: Int
    
    init(title: String, author: String, type: Int, status: Int) {
        self.title = title
        self.author = author
        self.type = type
        self.status = status
    }
}
