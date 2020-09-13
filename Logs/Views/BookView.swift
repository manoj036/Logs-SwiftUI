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
        sortDescriptors: [NSSortDescriptor(keyPath: \Page.date, ascending: false)]
    ) var pages: FetchedResults<Page>

    @Environment(\.managedObjectContext) var moc
    @State private var showAddEntryAlert = false

    var body: some View {
        ZStack {
            List(pages, id: \.id, rowContent: { entry in
                let pageView = PageView(page: entry).environment(\.managedObjectContext, moc)
                NavigationLink(destination: pageView) {
                    Text(entry.name)
                }
            })
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Books")
            FloatingActionButton(diameter: 60, action: {
                showAddEntryAlert = true
            })
        }.popover(isPresented: $showAddEntryAlert, content: {
            AddEntryView { text in
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
