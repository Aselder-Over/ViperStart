//
//  MainTVManager.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 16.04.2021.
//

import UIKit

protocol MainTableViewManagerInput {
    func setup(tableView: UITableView)
    func update(with viewModel: TableMainViewModel)
}


final class MainTableViewManager: NSObject {
    
    // MARK: - Properties
    
    private weak var tableView: UITableView?
    private var viewModel: TableMainViewModel?
}


// MARK: - TreatmentDetailsTableViewManagerInput
extension MainTableViewManager: MainTableViewManagerInput {
    
    func setup(tableView: UITableView) {
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.contentInset.bottom = 20
        
        self.tableView = tableView
    }
    
    func update(with viewModel: TableMainViewModel) {
        self.viewModel = viewModel
        tableView?.reloadData()
    }
    
    func showContacts(with viewModel: TableMainViewModel) {
        self.viewModel = viewModel
        tableView?.reloadSections(IndexSet(integer: 2), with: .bottom)
    }
    
    func hideContacts(with viewModel: TableMainViewModel) {
        self.viewModel = viewModel
        tableView?.reloadSections(IndexSet(integer: 2), with: .top)
    }
}


// MARK: - UITableViewDataSource
extension MainTableViewManager: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sections.count ?? 0
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.sections[section].rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let row = viewModel?.sections[indexPath.section].rows[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseId, for: indexPath)
        row.configurator.configure(cell: cell)
        return cell
    }
}
