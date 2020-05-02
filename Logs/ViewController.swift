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

    private var notes = [String]()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        title = "Logs"
        setupAddButton()
        setupTableView()
    }

    private func setupAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc private func addNote() {
        let title = "Add new note"
        let sheet = UIAlertController(
            title: title,
            message: nil,
            preferredStyle: .alert
        )
        sheet.addTextField {
            $0.placeholder = "Buy a Chocolate"
        }
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(
            UIAlertAction(title: "Add", style: .default, handler: { _ in
                if let text = sheet.textFields?.first?.text {
                    self.notes.append(text)
                    self.tableView.reloadData()
                }
            })
        )
        present(sheet, animated: true)
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.easy.layout([
            Edges(0)
        ])
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Note View") ?? UITableViewCell(style: .default, reuseIdentifier: "Note View")

        cell.textLabel?.text = notes[indexPath.row]
        return cell
    }
}
