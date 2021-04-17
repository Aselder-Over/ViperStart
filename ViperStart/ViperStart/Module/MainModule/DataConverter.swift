//
//  DataConverter.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import CoreGraphics
import Foundation

protocol MainDataConverterInput {
    func convert(main: MainModel) -> TableMainViewModel
}


final class MainDataConverter {
    
    // MARK: - Typealias
    
    private typealias Row = TableMainViewModel.Section.Row
    private typealias Section = TableMainViewModel.Section
    
    private typealias MainEventConfigurator = TableCellConfigurator<MainEventCell, MainEventCell.Model>
    private typealias FighterConfigurator = TableCellConfigurator<FighterCell, FighterCell.Model>
    private typealias LastEventConfigurator = TableCellConfigurator<LastEventCell, LastEventCell.Model>
    private typealias MerchConfigurator = TableCellConfigurator<MerchCell, MerchCell.Model>
    
    private func assemblyMainSection(main: MainModel) -> Section {
        
        var rows: [Row] = []
        
        typealias MainEventModel = MainEventCell.Model
        let mainEvent = MainEventModel(mainEvent: main.mainEventBlock)
        
        let mainEventConfigurator = MainEventConfigurator(item: mainEvent)
        rows.append(Row(configurator: mainEventConfigurator))
        
        typealias FightersModel = FighterCell.Model
        let fighter = FightersModel(fighters: main.fightersBlock)
        
        let fightersConfigurator = FighterConfigurator(item: fighter)
        rows.append(Row(configurator: fightersConfigurator))
        
        typealias LastEventsModel = LastEventCell.Model
        let lastEvent = LastEventsModel(lastEvents: main.lastEvent)
        
        let lastEventsConfigurator = LastEventConfigurator(item: lastEvent)
        rows.append(Row(configurator: lastEventsConfigurator))
        
        typealias MerchsModel = MerchCell.Model
        let merch = MerchsModel(merchs: main.merchBlock)
        
        let merchConfigurator = MerchConfigurator(item: merch)
        rows.append(Row(configurator: merchConfigurator))
        
        return Section(headerTitle: nil, rows: rows)
    }
}


extension MainDataConverter: MainDataConverterInput {
    
    func convert(main: MainModel) -> TableMainViewModel {
        
        var sections: [Section] = []
        let mainSection = assemblyMainSection(main: main)
        sections.append(mainSection)
        
        return TableMainViewModel(sections: sections)
    }
}
