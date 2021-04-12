//
//  NSObject+Utils.swift
//  books-on-the-table
//
//  Created by administrator on 4/11/21.
//

import Foundation

extension NSObject {
    
    open class func simpleCassName() -> String {
        guard let className = object_getClass(self) else { return "" }
        let fullClassname: String = NSStringFromClass(className)
        let classNameComponenets = fullClassname.split {$0 == "."}.map(String.init)
        guard let returnedName = classNameComponenets.last else { return "" }
        return returnedName
    }
    
}
