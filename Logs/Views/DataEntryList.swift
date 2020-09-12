//
//  DataEntryList.swift
//  Logs
//
//  Created by manoj.gubba on 2020/09/06.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import SwiftUI

struct DataEntryList: View {
    var elements: FetchedResults<DataEntry>
    var body: some View {
        List(elements, id: \.id, rowContent: { entry in
            entry.text.map(Text.init)
        })
        .listStyle(GroupedListStyle())
        .navigationBarTitle("List")
    }
}
