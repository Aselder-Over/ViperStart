//
//  MainViewModel.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import Foundation

struct TableMainViewModel {
    
    let sections: [Section]
    
    struct Section {
        
        let headerTitle: String?
        let rows: [Row]
        
        
        // MARK: - Row
        
        struct Row {
            
            // MARK: - Properties
            
            let configurator: TableCellConfiguratorProtocol
            
            var reuseId: String {
                return type(of: configurator).reuseId
            }
        }
    }
}
