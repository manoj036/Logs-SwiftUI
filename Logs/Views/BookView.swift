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
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Page.id, ascending: true)
        ]
    ) var pages: FetchedResults<Page>

    @Environment(\.managedObjectContext) var moc
    @State private var showAddEntryAlert = false
    @State var page: Page?

    func pageView(for page: Page?) -> some View {
        PageView(page: page).environment(\.managedObjectContext, moc)
    }

    var body: some View {
        let pushChild = Binding<Bool>(
            get: {
                page != nil
            },
            set: { _ in page = nil }
        )

        NavigationView {
            VStack {
                NavigationLink(destination: pageView(for: page), isActive: pushChild) {}
                ViewGenerator.addFAB(
                    to: AnyView(
                        List(pages, id: \.id, rowContent: { entry in
                            HStack {
                                Text(entry.name)
                            }.onTapGesture {
                                page = entry
                            }
                        })
                        .listStyle(GroupedListStyle())
                        .navigationBarTitle("Book")
                    ),
                    side: 60,
                    action: {
                        showAddEntryAlert = true
                    }
                ).popover(isPresented: $showAddEntryAlert, content: {
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
        }
    }

    func saveContext() {
        do {
            try moc.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
}
