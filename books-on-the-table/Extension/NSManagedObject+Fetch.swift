//
//  NSManagedObject+Fetch.swift
//  books-on-the-table
//
//  Created by administrator on 4/11/21.
//

import CoreData

public extension NSManagedObject {
    
    class func lastObject<T>(
        from request: NSFetchRequest<T>,
        in context: NSManagedObjectContext) -> T? where T: NSManagedObject {
        if let searchResults = try? context.fetch(request), searchResults.count > 0 {
            return searchResults.last
        }
        return nil
    }
    
    class func allObjects<T>(
        from request: NSFetchRequest<T>,
        in context: NSManagedObjectContext) -> [T] where T: NSManagedObject {
        var results: [T] = []
        if let searchResults = try? context.fetch(request) {
            results = searchResults
        }
        return results
    }
}
