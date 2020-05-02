//
//  RootViewController.swift
//  Logs
//
//  Created by manoj.gubba on 2020/05/02.
//  Copyright © 2020 manoj.gubba. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    let rootView = RootView()

    private var notes = [String]()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Buy a Chocolate" }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { _ in
            if let text = alert.textFields?.first?.text {
                self.notes.append(text)
                self.rootView.tableView.reloadData()
            }
        })

        alert.addAction(cancelAction)
        alert.addAction(addAction)
        present(alert, animated: true)
    }

    private func setupTableView() {
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
    }
}

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Note View") ?? UITableViewCell(style: .default, reuseIdentifier: "Note View")

        cell.textLabel?.text = notes[indexPath.row]
        return cell
    }
}
