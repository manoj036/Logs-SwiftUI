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
    var valueChanged: ((String?) -> Void)?
    var body: some View {
        NavigationView {
            List {
                TextField("Buy onions 🧅", text: $title) {
                    self.valueChanged?(self.title)
                }.introspectTextField {
                    $0.becomeFirstResponder()
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Entry")
            .navigationBarItems(leading:
                Button(action: {
                    self.valueChanged?(nil)
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }))
        }
        
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView()
    }
}
