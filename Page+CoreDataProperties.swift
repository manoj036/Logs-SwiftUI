//
//  Page+CoreDataProperties.swift
//  Logs
//
//  Created by manoj.gubba on 2020/09/13.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//
//

import Foundation
import CoreData

extension Page {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Page> {
        return NSFetchRequest<Page>(entityName: "Page")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var date: Date
    @NSManaged public var entries: NSSet

    public var entriesArray: [DataEntry] {
        let entries = self.entries as? Set<DataEntry> ?? []
        return entries.sorted { $0.date > $1.date }
    }
}

// MARK: Generated accessors for entries
extension Page {

    @objc(addEntriesObject:)
    @NSManaged public func addToEntries(_ value: DataEntry)

    @objc(removeEntriesObject:)
    @NSManaged public func removeFromEntries(_ value: DataEntry)

    @objc(addEntries:)
    @NSManaged public func addToEntries(_ values: NSSet)

    @objc(removeEntries:)
    @NSManaged public func removeFromEntries(_ values: NSSet)

}

extension Page: Identifiable {

}
