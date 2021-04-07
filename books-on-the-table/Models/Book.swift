//
//  Livro.swift
//  books-on-the-table
//
//  Created by administrator on 3/30/21.
//

import UIKit

struct Book: Codable {
    
    enum Genre: String, Codable {
        case horror = "Horror"
        case comedy = "Comedy"
        case drama = "Drama"
        case fantasy = "Fantasy"
    }
    
    enum Status: String, Codable {
        case reading = "Reading"
        case done = "Done"
        case toRead = "To Read"
    }
    
    let id: String
    let title: String
    let author: String
    let type: Genre
    let status: Status
    
    init(id: String, title: String, author: String, type: Genre, status: Status) {
        self.id = id
        self.title = title
        self.author = author
        self.type = type
        self.status = status
    }
}

extension Book {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case author
        case type = "genre"
        case status
    }
}
