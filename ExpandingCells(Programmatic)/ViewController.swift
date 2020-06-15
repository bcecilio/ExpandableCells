//
//  ViewController.swift
//  ExpandingCells(Programmatic)
//
//  Created by Brendon Cecilio on 6/13/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainView = TableView()
    
    let resources = [
        ResourceCells(title: "Action 1", description: "YEYEYEYEEYEEEYEYYYEEYYEE"),
        ResourceCells(title: "Action 2", description: "YEYEYEYEEYEEEYEYYYEEYYEE"),
        ResourceCells(title: "Action 3", description: "YEYEYEYEEYEEEYEYYYEEYYEE"),
        ResourceCells(title: "Action 4", description: "YEYEYEYEEYEEEYEYYYEEYYEE")
    ]
    
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
    }
    
    private func setupTableView() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.register(Cells.self, forCellReuseIdentifier: "cell")
        mainView.tableView.separatorStyle = .none
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Cells else {
            fatalError("it no dequeue bro")
        }
        let data = resources[indexPath.row]
        cell.configureCell(with: data)
        cell.selectionStyle = .none
        cell.animate()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if selectedIndex == indexPath {
            return 200
        }
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.endUpdates()
    }
}

