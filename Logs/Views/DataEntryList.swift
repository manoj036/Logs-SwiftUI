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
