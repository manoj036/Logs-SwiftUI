//
//  BaseView.swift
//  Logs
//
//  Created by manoj.gubba on 2020/05/04.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import SwiftUI

struct BaseView: View {
    @State private var notes: [DataEntry] = []
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
                        self.notes.append(DataEntry(text: text))
                    }
                    self.showAddEntryAlert = false
                }
            })
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
