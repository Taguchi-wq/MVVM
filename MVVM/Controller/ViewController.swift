//
//  ViewController.swift
//  MVVM
//
//  Created by cmStudent on 2021/11/18.
//

import UIKit

final class ViewController: UIViewController {
    
    private let viewModel = UserListViewModel()

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView(tableView)
        reloadTableView()
    }

    private func setupTableView(_ tableView: UITableView) {
        tableView.dataSource = self
    }
    
    private func reloadTableView() {
        viewModel.users.bind { _ in
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let users = viewModel.users.value
        return users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = viewModel.users.value?[indexPath.row]
        cell.textLabel?.text = user?.name
        return cell
    }
    
}

