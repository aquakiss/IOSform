//
//  Form+CoreDataProperties.swift
//  DynamiqueForm
//
//  Created by Developer on 23/03/2017.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation
import CoreData

extension Form {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Form> {
        return NSFetchRequest<Form>(entityName: "Form");
    }

    @NSManaged public var idForm: NSData?
    @NSManaged public var nom: String?
    @NSManaged public var champF: NSSet?

}

// MARK: Generated accessors for champF
extension Form {

    @objc(addChampFObject:)
    @NSManaged public func addToChampF(_ value: Champ)

    @objc(removeChampFObject:)
    @NSManaged public func removeFromChampF(_ value: Champ)

    @objc(addChampF:)
    @NSManaged public func addToChampF(_ values: NSSet)

    @objc(removeChampF:)
    @NSManaged public func removeFromChampF(_ values: NSSet)

}
