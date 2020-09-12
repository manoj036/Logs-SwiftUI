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
        sortDescriptors: []
    ) var pages: FetchedResults<Page>

    @Environment(\.managedObjectContext) var moc
    @State private var showAddEntryAlert = false
    @State var displayedPage: Page?

    var pageView: some View {
        PageView(page: displayedPage).environment(\.managedObjectContext, moc)
    }

    var body: some View {
        let pushChild = Binding<Bool>(get: { displayedPage != nil }, set: { if !$0 {  displayedPage = nil }})

        ZStack {
            NavigationLink(destination: pageView, isActive: pushChild) {}
            List(pages, id: \.id, rowContent: { entry in
                HStack {
                    Text(entry.name)
                }.onTapGesture {
                    displayedPage = entry
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
                    let entry = Page(context: moc)
                    entry.id = UUID()
                    entry.date = Date()
                    entry.name = text
                    saveContext()
                }
                showAddEntryAlert = false
            }
        })
    }

    func saveContext() {
        do {
            try moc.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
}
