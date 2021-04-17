//
//  MerchCVDataConverter.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 15.04.2021.
//

import CoreGraphics
import Foundation


final class MerchCVDataConverter {
    
    // MARK: - Typealias
    
    private typealias Row = CollectionMainViewModel.Section.Row
    private typealias Section = CollectionMainViewModel.Section
    
    private typealias MerchConfigurator = CollectionCellConfigurator<MerchCVCell, MerchCVCell.Model>
    
    private func assemblyMerchSection(merch: MainModel.MerchBlock) -> Section {
        
        var rows: [Row] = []
        
        typealias MerchModel = MerchCVCell.Model
        let merch = MerchModel(merch: merch)
        
        let merchConfigurator = MerchConfigurator(item: merch, size: CGSize(width: 400, height: 400))
        rows.append(Row(configurator: merchConfigurator))
        
        return Section(headerTitle: nil, rows: rows)
    }
}


extension MerchCVDataConverter: CVDataConverterInput {
    
    typealias MainCVModel = MainModel.MerchBlock
    func convert(item: MainCVModel) -> CollectionMainViewModel {
        
        var sections: [Section] = []
        let merchSection = assemblyMerchSection(merch: item)
        sections.append(merchSection)
        
        return CollectionMainViewModel(sections: sections)
    }
}
