//
//  PageView.swift
//  Logs
//
//  Created by manoj.gubba on 2020/05/04.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import SwiftUI
import CoreData

struct PageView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var page: Page?

    var notes: [DataEntry] {
        page?.entriesArray ?? []
    }

    @State private var showAddEntryAlert = false

    var body: some View {
        ZStack {
            DataEntryList(elements: notes)
            FloatingActionButton(diameter: 60, action: {
                self.showAddEntryAlert = true
            })
        }.popover(isPresented: $showAddEntryAlert, content: {
            AddEntryView { text in
                if let text = text {
                    let entry = DataEntry(context: managedObjectContext)
                    entry.text = text
                    entry.id = UUID()
                    entry.date = Date()
                    entry.page = page
                    saveContext()
                }
                self.showAddEntryAlert = false
            }
        }).navigationBarTitle("Books > " + (page?.name ?? ""))
    }

    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
}
