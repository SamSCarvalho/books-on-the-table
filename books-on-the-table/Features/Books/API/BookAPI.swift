//
//  BookAPI.swift
//  books-on-the-table
//
//  Created by administrator on 4/5/21.
//

import Foundation
import Awe

class BookAPI {
    
    let api: API
    
    init(with rootUrl: String = BooksConstants.kBooksApiUrl) {
        self.api = API(rootUrl)
    }
    
    // MARK: - HEADERS
    
    func headers(with token: String) -> [String: String] {
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
    }
    
    // MARK: - GET ALL
    
    func allBooks(token: String, page: Int = 0, perPage: Int = 200, completion: @escaping ((Result<BookList, Error>) -> Void), retryAttempts: Int = 0) {

        let targetUrl = "/books?page=\(page)&per=\(perPage)"

        api.get(targetUrl: targetUrl,
                requestHeaders: headers(with: token),
                completionHandler: completion,
                retryAttempts: retryAttempts)
    }
    
    // MARK: - CREATE
    
    func create(book: Book, token: String) {
        
        let targetUrl = "/books"

        
        if let encoded = try? JSONEncoder().encode(book) {
            api.post(targetUrl: targetUrl,
                     requestData: encoded,
                     requestHeaders: headers(with: token),
                     completionHandler: { (result: Result<BookList, Error>) in
                switch (result) {
                    case .success(let response):
                        print("response: \(response)")
                    case .failure(let error):
                        print("returned error: \(error)")
                }
            }, retryAttempts: 0)
        }
    }
    
    // MARK: - UPDATE
    
    func update(book: Book, bookId: String, token: String) {
        
        let targetUrl = "/books/\(bookId)"

        if let encoded = try? JSONEncoder().encode(book) {
            api.put(targetUrl: targetUrl,
                    requestData: encoded,
                    requestHeaders: headers(with: token),
                    completionHandler: { (result: Result<Book, Error>) in
                        switch (result) {
                            case .success(let response):
                                debugPrint("response success updated: \(response)")
                            case .failure(let error):
                                debugPrint("returned error: \(error)")
                        }
                    },
                    retryAttempts: 0)
        }
    }
    
    // MARK: - DELETE
    
    func delete(bookId: String, token: String) {
        
        let targetUrl = "/books/\(bookId)"
        
        api.delete(targetUrl: targetUrl,
                   requestHeaders: headers(with: token),
                   completionHandler: { (result: Result<Book, Error>) in
                       switch (result) {
                           case .success(let response):
                               debugPrint("response success updated: \(response)")
                           case .failure(let error):
                               debugPrint("returned error: \(error)")
                       }
                   },
                   retryAttempts: 0)
    }
}
