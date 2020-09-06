//
//  FloatingActionButton.swift
//  Logs
//
//  Created by manoj.gubba on 2020/09/06.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import SwiftUI

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

struct FAB_previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton(
            side: 60,
            action: {}
        )
    }
}
