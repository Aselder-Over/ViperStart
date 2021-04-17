//
//  LastEventCVDataConverter.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 15.04.2021.
//

import CoreGraphics
import Foundation


final class LastEventCVDataConverter {
    
    // MARK: - Typealias
    
    private typealias Row = CollectionMainViewModel.Section.Row
    private typealias Section = CollectionMainViewModel.Section
    
    private typealias LastEventConfigurator = CollectionCellConfigurator<LastEventCVCell, LastEventCVCell.Model>
    
    private func assemblyLastEventSection(lastEvent: MainModel.LastEvent) -> Section {
        
        var rows: [Row] = []
        
        typealias LastEventModel = LastEventCVCell.Model
        let lastEvent = LastEventModel(lastEvent: lastEvent)
        
        let lastEventConfigurator = LastEventConfigurator(item: lastEvent, size: CGSize(width: 400, height: 400))
        rows.append(Row(configurator: lastEventConfigurator))
        
        return Section(headerTitle: nil, rows: rows)
    }
}


extension LastEventCVDataConverter: CVDataConverterInput {
    
    typealias MainCVModel = MainModel.LastEvent
    
    func convert(item: MainModel.LastEvent) -> CollectionMainViewModel {
        var sections: [Section] = []
        let lastEventSection = assemblyLastEventSection(lastEvent: item)
        sections.append(lastEventSection)
        
        return CollectionMainViewModel(sections: sections)
    }
}
