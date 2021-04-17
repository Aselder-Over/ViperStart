//
//  MainCVViewModel.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 15.04.2021.
//

import Foundation

struct CollectionMainViewModel {
    
    let sections: [Section]
    
    struct Section {
        
        let headerTitle: String?
        let rows: [Row]
        
        
        // MARK: - Row
        
        struct Row {
            
            // MARK: - Properties
            
            let configurator: CollectionCellConfiguratorProtocol
            
            var reuseId: String {
                return type(of: configurator).reuseId
            }
        }
    }
}
