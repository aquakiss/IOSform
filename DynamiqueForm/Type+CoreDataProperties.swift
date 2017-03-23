//
//  Type+CoreDataProperties.swift
//  DynamiqueForm
//
//  Created by Developer on 23/03/2017.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation
import CoreData

extension Type {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Type> {
        return NSFetchRequest<Type>(entityName: "Type");
    }

    @NSManaged public var idType: NSData?
    @NSManaged public var label: String?
    @NSManaged public var typeT: NSSet?

}

// MARK: Generated accessors for typeT
extension Type {

    @objc(addTypeTObject:)
    @NSManaged public func addToTypeT(_ value: Champ)

    @objc(removeTypeTObject:)
    @NSManaged public func removeFromTypeT(_ value: Champ)

    @objc(addTypeT:)
    @NSManaged public func addToTypeT(_ values: NSSet)

    @objc(removeTypeT:)
    @NSManaged public func removeFromTypeT(_ values: NSSet)

}
