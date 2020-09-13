//
//  Page+CoreDataProperties.swift
//  Logs
//
//  Created by manoj.gubba on 2020/09/12.
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
    @NSManaged public var entries: NSSet
    @NSManaged public var date: Date

    public var entriesArray: [DataEntry] {
        let entries = self.entries as? Set<DataEntry> ?? []
        return entries.sorted { $0.date > $1.date }
    }
}

// MARK: Generated accessors for entries
extension Page {

    @objc(insertObject:inEntriesAtIndex:)
    @NSManaged public func insertIntoEntries(_ value: DataEntry, at idx: Int)

    @objc(removeObjectFromEntriesAtIndex:)
    @NSManaged public func removeFromEntries(at idx: Int)

    @objc(insertEntries:atIndexes:)
    @NSManaged public func insertIntoEntries(_ values: [DataEntry], at indexes: NSIndexSet)

    @objc(removeEntriesAtIndexes:)
    @NSManaged public func removeFromEntries(at indexes: NSIndexSet)

    @objc(replaceObjectInEntriesAtIndex:withObject:)
    @NSManaged public func replaceEntries(at idx: Int, with value: DataEntry)

    @objc(replaceEntriesAtIndexes:withEntries:)
    @NSManaged public func replaceEntries(at indexes: NSIndexSet, with values: [DataEntry])

    @objc(addEntriesObject:)
    @NSManaged public func addToEntries(_ value: DataEntry)

    @objc(removeEntriesObject:)
    @NSManaged public func removeFromEntries(_ value: DataEntry)

    @objc(addEntries:)
    @NSManaged public func addToEntries(_ values: NSOrderedSet)

    @objc(removeEntries:)
    @NSManaged public func removeFromEntries(_ values: NSOrderedSet)

}

extension Page: Identifiable {

}
