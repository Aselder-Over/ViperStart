//
//  ViewController.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import UIKit

protocol MainViewInput: AnyObject {
    func update(with viewModel: TableMainViewModel)
}


final class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private var presenter: MainViewOutput?
    private var tableViewManager: MainTableViewManagerInput?
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewManager?.setup(tableView: tableView)
        presenter?.viewIsReady()
    }
}


extension ViewController: MainViewInput {
    
    func update(with viewModel: TableMainViewModel) {
        tableViewManager?.update(with: viewModel)
    }
}
