//
//  EmptyListView.swift
//  Logs
//
//  Created by manoj.gubba on 2020/09/13.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack {
            Image(systemName: "book")
                .font(.largeTitle)
                .foregroundColor(.blue)
            Text("No notes to show.\n Add them easily by clicking on the `+` icon, present on the bottom left corner.")
                .multilineTextAlignment(.center)
                .padding(.all, 16)
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
