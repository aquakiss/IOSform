//
//  Champ+CoreDataProperties.swift
//  DynamiqueForm
//
//  Created by Developer on 23/03/2017.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation
import CoreData

extension Champ {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Champ> {
        return NSFetchRequest<Champ>(entityName: "Champ");
    }

    @NSManaged public var idChamp: NSData?
    @NSManaged public var label: String?
    @NSManaged public var value: String?
    @NSManaged public var formC: Form?
    @NSManaged public var typeC: Type?

}
