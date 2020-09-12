//
//  DataEntry+CoreDataProperties.swift
//  Logs
//
//  Created by manoj.gubba on 2020/09/12.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//
//

import Foundation
import CoreData

extension DataEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DataEntry> {
        return NSFetchRequest<DataEntry>(entityName: "DataEntry")
    }

    @NSManaged public var date: Date
    @NSManaged public var id: UUID
    @NSManaged public var text: String
    @NSManaged public var page: Page?

}

extension DataEntry: Identifiable {

}
