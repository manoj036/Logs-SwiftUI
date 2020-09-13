//
//  FloatingActionButton.swift
//  Logs
//
//  Created by manoj.gubba on 2020/09/06.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import SwiftUI

struct FloatingActionButton: View {
    var diameter: CGFloat
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
                            .font(Font.system(size: diameter/2))
                            .frame(width: diameter, height: diameter, alignment: .center)
                            .foregroundColor(.white)
                    }
                )
                .accessibility(identifier: "fab_add")
                .background(Color.blue)
                .cornerRadius(diameter/2)
                .padding(.all, 16)
                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 3, y: 3)
            }
        }
    }
}

struct FAB_previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton(
            diameter: 60,
            action: {}
        )
    }
}
