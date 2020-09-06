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
        List(elements, id: \.id, rowContent: { entry in
            Text(entry.text)
        })
        .listStyle(GroupedListStyle())
        .navigationBarTitle("List")
    }
}

struct DataEntryList_Previews: PreviewProvider {
    static var previews: some View {
        DataEntryList(elements: [
            DataEntry(text: "1"),
            DataEntry(text: "2"),
            DataEntry(text: "3"),
            DataEntry(text: "4"),
            DataEntry(text: "5"),
            DataEntry(text: "6"),
        ])
    }
}
