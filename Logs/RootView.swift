//
//  RootView.swift
//  Logs
//
//  Created by manoj.gubba on 2020/05/02.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import UIKit
import EasyPeasy

class RootView: UIView {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    private func configure() {
        backgroundColor = .white
        addSubview(tableView)
        tableView.easy.layout([
            Edges(0)
        ])
    }
}
