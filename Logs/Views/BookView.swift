//
//  BookView.swift
//  Logs
//
//  Created by manoj.gubba on 2020/09/12.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import SwiftUI
import CoreData

struct BookView: View {
    @FetchRequest(
        entity: Page.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Page.date, ascending: true)]
    ) var pages: FetchedResults<Page>

    @Environment(\.managedObjectContext) var moc
    @State private var showAddEntryAlert = false

    var body: some View {
        ZStack {
            if pages.isEmpty {
                EmptyListView()
            } else {
                List {
                    ForEach(pages, id: \.self) { entry in
                        let pageView = PageView(page: entry).environment(\.managedObjectContext, moc)
                        NavigationLink(destination: pageView) {
                            Text(entry.name)
                        }
                    }.onDelete { indexSet in
                        let elements = indexSet.map { pages[$0] }
                        elements.forEach {
                            moc.delete($0)
                        }
                        try? moc.save()
                    }
                }
                .listStyle(GroupedListStyle())
            }
            FloatingActionButton(diameter: 60, action: {
                showAddEntryAlert = true
            })
        }
        .navigationBarTitle("Pages")
        .popover(isPresented: $showAddEntryAlert, content: {
            AddEntryView(headerText: "New Page", placeholder: "Chapter 0 📘") { text in
                if let text = text {
                    saveBook(text)
                }
                showAddEntryAlert = false
            }
        })

    }

    private func saveBook(_ name: String) {
        let entry = Page(context: moc)
        entry.id = UUID()
        entry.date = Date()
        entry.name = name
        try? moc.save()
    }
}
