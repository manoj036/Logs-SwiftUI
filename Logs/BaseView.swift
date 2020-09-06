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

    var body: some View {
        NavigationView {
            ZStack {
                List(notes, id: \.id, rowContent: { entry in
                    Text(entry.text)
                })
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle("List")
                FloatingActionButton(
                side: 60) {
                    self.notes.append(DataEntry(text: "\(Int.random(in: 0...10))"))
                }
            }
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

struct FloatingActionButton: View {
    var side: CGFloat
    var action: (() -> Void)
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(
                    action: action,
                    label: {
                        Image(systemName: "plus")
                            .font(Font.system(size: side/2))
                            .frame(width: side, height: side, alignment: .center)
                            .foregroundColor(.white)
                }).background(Color.blue)
                    .cornerRadius(side/2)
                    .padding(.all, 16)
                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 3, y: 3)
            }
        }
    }
}
