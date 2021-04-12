//
//  EntityBook+CoreDataProperties.swift
//  books-on-the-table
//
//  Created by administrator on 4/11/21.
//
//

import Foundation
import CoreData


extension EntityBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntityBook> {
        return NSFetchRequest<EntityBook>(entityName: "Book")
    }

    @NSManaged public var remotedId: String?
    @NSManaged public var title: String?
    @NSManaged public var author: String?
    @NSManaged public var genre: String?
    @NSManaged public var status: String?

}

extension EntityBook : Identifiable {

}
