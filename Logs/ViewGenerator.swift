//
//  ViewGenerator.swift
//  Logs
//
//  Created by manoj.gubba on 2020/09/06.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import Foundation
import SwiftUI

class ViewGenerator {
    static func addFAB(to view: AnyView, side: CGFloat, action: @escaping() -> Void) -> some View {
        ZStack {
            view
            FloatingActionButton(side: side, action: action)
        }
    }
}
