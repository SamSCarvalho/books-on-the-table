//
//  Livro.swift
//  books-on-the-table
//
//  Created by administrator on 3/30/21.
//

import UIKit

struct Book: Codable {
    
    // MARK: - Genre ENUM
    
    enum Genre: String, Codable, CaseIterable {
        case horror = "Horror"
        case comedy = "Comedy"
        case drama = "Drama"
        case fantasy = "Fantasy"
    }
    
    // MARK: - Status ENUM
    
    enum Status: String, Codable, CaseIterable {
        case reading = "Reading"
        case done = "Done"
        case toRead = "To Read"
    }
    
    // MARK: - Atributes
    
    let id: String?
    let title: String
    let author: String
    let type: Genre
    let status: Status
    
    // MARK: - Constructor
    
    init(id: String? = nil, title: String, author: String, type: Genre, status: Status) {
        self.id = id
        self.title = title
        self.author = author
        self.type = type
        self.status = status
    }
}

// MARK: - Extension

extension Book {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case author
        case type = "genre"
        case status
    }
}
