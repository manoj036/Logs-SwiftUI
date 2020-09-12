//
//  BaseView.swift
//  Logs
//
//  Created by manoj.gubba on 2020/05/04.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import SwiftUI

struct BaseView: View {
    @FetchRequest(
      entity: DataEntry.entity(),
      sortDescriptors: [
        NSSortDescriptor(keyPath: \DataEntry.date, ascending: true)
      ]
    ) var notes: FetchedResults<DataEntry>

    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var showAddEntryAlert = false

    var body: some View {
        NavigationView {
            ViewGenerator.addFAB(
                to: AnyView(DataEntryList(elements: notes)),
                side: 60,
                action: {
                    self.showAddEntryAlert = true
                }
            ).popover(isPresented: $showAddEntryAlert, content: {
                AddEntryView { text in
                    if let text = text {
                        let entry = DataEntry(context: managedObjectContext)
                        entry.text = text
                        entry.id = UUID()
                        entry.date = Date()

                        saveContext()
                    }
                    self.showAddEntryAlert = false
                }
            })
        }
    }

    func saveContext() {
      do {
        try managedObjectContext.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
