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
    
    init(with rootUrl: String) {
        self.api = API(rootUrl)
    }
    
    func headers(with token: String) -> [String: String] {
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
    }
    
    func allBooks(token: String, page: Int = 0, perPage: Int = 200, completion: @escaping ((Result<BookList, Error>) -> Void), retryAttempts: Int = 0) {

        let targetUrl = "/books?page=\(page)&per=\(perPage)"

        api.get(targetUrl: targetUrl,
                requestHeaders: headers(with: token),
                completionHandler: completion,
                retryAttempts: retryAttempts)
    }
    
    func create(book: Book, token: String) {
        
//        let targetUrl = ""
        
        // TO-DO api.post
    }
    
}
