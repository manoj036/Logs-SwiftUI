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
    @Environment(\.managedObjectContext) var moc
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
                    saveEntry(text)
                }
                self.showAddEntryAlert = false
            }
        }).navigationBarTitle("Books > " + (page?.name ?? ""))
    }

    private func saveEntry(_ text: String) {
        let entry = DataEntry(context: moc)
        entry.text = text
        entry.id = UUID()
        entry.date = Date()
        entry.page = page
        try? moc.save()
    }
}
