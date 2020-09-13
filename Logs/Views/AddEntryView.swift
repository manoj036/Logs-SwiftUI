//
//  AddEntryView.swift
//  Logs
//
//  Created by manoj.gubba on 2020/09/06.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import SwiftUI
import Introspect

struct AddEntryView: View {
    @State var title: String = ""
    var headerText = "Entry"
    var placeholder = "Enter the field info 📝"
    var valueChanged: ((String?) -> Void)?
    var body: some View {
        NavigationView {
            List {
                TextField(
                    placeholder,
                    text: $title,
                    onCommit: {
                        self.valueChanged?(self.title)
                    }
                )
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(headerText)
            .navigationBarItems(
                leading: Button(
                    action: {
                        self.valueChanged?(nil)
                    },
                    label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                )
            )
        }
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView()
    }
}
