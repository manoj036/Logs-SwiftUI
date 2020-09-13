//
//  DataEntryList.swift
//  Logs
//
//  Created by manoj.gubba on 2020/09/06.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import SwiftUI

struct DataEntryList: View {
    var elements: [DataEntry]
    var body: some View {
        if elements.isEmpty {
            VStack {
                Image(systemName: "book")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Text("No notes to show.\n Add them easily by clicking on the `+` icon, present on the bottom left corner.")
                    .multilineTextAlignment(.center)
                    .padding(.all, 16)
            }
        } else {
            List(elements, id: \.id, rowContent: { entry in
                Text(entry.text)
            })
            .listStyle(GroupedListStyle())
        }
    }
}
