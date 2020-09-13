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
    @FetchRequest(
        entity: DataEntry.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \DataEntry.date, ascending: true)]
    ) var entries: FetchedResults<DataEntry>

    var page: Page

    var notes: [DataEntry] {
        entries.filter { $0.page == page }
    }

    @State private var showAddEntryAlert = false

    var body: some View {
        ZStack {
            if notes.isEmpty {
                VStack {
                    Image(systemName: "book")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    Text("No notes to show.\n Add them easily by clicking on the `+` icon, present on the bottom left corner.")
                        .multilineTextAlignment(.center)
                        .padding(.all, 16)
                }
            } else {
                List {
                    ForEach(notes, id: \.id) {  entry in
                        Text(entry.text)
                    }.onDelete { indexSet in
                        let elements = indexSet.map { notes[$0] }
                        elements.forEach {
                            moc.delete($0)
                        }
                        try? moc.save()
                    }
                }
                .listStyle(GroupedListStyle())
            }
            FloatingActionButton(diameter: 60, action: {
                self.showAddEntryAlert = true
            })
        }.popover(isPresented: $showAddEntryAlert, content: {
            AddEntryView(headerText: "New Entry", placeholder: "Buy Onions 🧅 📝") { text in
                if let text = text {
                    saveEntry(text)
                }
                self.showAddEntryAlert = false
            }
        }).navigationBarTitle(page.name)
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
