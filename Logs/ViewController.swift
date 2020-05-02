//
//  ViewController.swift
//  Logs
//
//  Created by manoj.gubba on 2020/05/02.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import UIKit
import EasyPeasy

class ViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Hello World"
        view.addSubview(label)
        label.easy.layout([
            Center(0)
        ])
    }
}

