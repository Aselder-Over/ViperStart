//
//  FighterCVDataConverter.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 15.04.2021.
//

import CoreGraphics
import Foundation


final class FighterDataConverter {
    
    // MARK: - Typealias
    
    private typealias Row = CollectionMainViewModel.Section.Row
    private typealias Section = CollectionMainViewModel.Section
    
    private typealias FighterConfigurator = CollectionCellConfigurator<FighterCVCell, FighterCVCell.Model>
    
    private func assemblyFighterSection(fighter: MainModel.FightersBlock) -> Section {
        
        var rows: [Row] = []
        
        typealias FighterModel = FighterCVCell.Model
        let fighter = FighterModel(fighter: fighter)
        
        let fighterConfigurator = FighterConfigurator(item: fighter, size: CGSize(width: 400, height: 400))
        rows.append(Row(configurator: fighterConfigurator))
        
        return Section(headerTitle: nil, rows: rows)
    }
}


extension FighterDataConverter: CVDataConverterInput {
    
    typealias MainCVModel = MainModel.FightersBlock
    
    func convert(item: MainModel.FightersBlock) -> CollectionMainViewModel {
        
        var sections: [Section] = []
        let fighterSection = assemblyFighterSection(fighter: item)
        sections.append(fighterSection)
        
        return CollectionMainViewModel(sections: sections)
    }
}
